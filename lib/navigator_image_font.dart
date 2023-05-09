import 'package:flutter/material.dart';
void main() => runApp(
    MaterialApp(
      title: "e7 App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "oooh",
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    )
);
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("e7 App"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Working on Navigator, Image and Font"),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (c)=> SecondPage()));
            }, child: Icon(Icons.forward)),
            Image.network("https://uploads-ssl.webflow.com/5f841209f4e71b2d70034471/6078b650748b8558d46ffb7f_Flutter%20app%20development.png", width: 200, height: 150, fit: BoxFit.fill,),
            Image.asset("assets/images/new/dollar-banknote.png"),
            Image.asset("assets/books.png"),
            Text("Flutter is beautiful"),
            Text("Flutter is beautiful", style: TextStyle(fontFamily: "oooh"),),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: MaterialButton(onPressed: (){
        //   Navigator.pop(context);
        // },child: Text("back"), color: Colors.lightGreen,),
        child: BackButton(),
      ),
      appBar: AppBar(title: Text("Second Page"),),
    );
  }
}

