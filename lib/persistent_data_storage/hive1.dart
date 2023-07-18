import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  runApp(
      MaterialApp(
        title: "e7 App",
        theme: ThemeData(
            primarySwatch: Colors.blue
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      )
  );
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var tec = TextEditingController();
  List<String?> books = [];
  late Box<String> boxBooks;

  @override
  void initState() {
    openMyBox();
    print("box is open");
    super.initState();
  }

  void openMyBox() async{
    boxBooks = await Hive.openBox("Books");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("e7 App"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                controller: tec,
                decoration: InputDecoration(hintText: "Enter book name"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){

                    if(tec.text.isNotEmpty){
                      // boxBooks.put("MyKey", tec.text);
                      boxBooks.add(tec.text);
                      print("saved");
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Saved")));
                      tec.clear();
                    }else{
                      ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(content: Text("You should enter the book name"), actions: [ElevatedButton(onPressed: (){
                        ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                      }, child: Text("Ok"))]));
                    }

                  }, child: Text("save")),
                  SizedBox(width: 10,),
                  ElevatedButton(onPressed: (){
                    books.clear();
                    // var temp = boxBooks.get("MyKey");
                    boxBooks.keys.forEach((key) {
                      var temp = boxBooks.get(key);
                      books.add(temp);
                      print(temp);
                    });
                    setState(() {});

                  }, child: Text("Restore")),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: books.length,
                    itemBuilder: (bc,i){
                    return Dismissible(key: Key("test"),child: ListTile(title: Text(books[i] ?? "no-name", style: TextStyle(fontSize: 30),),));
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

}