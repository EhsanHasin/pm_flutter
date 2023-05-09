import 'package:flutter/material.dart';
void main() => runApp(
    MaterialApp(
      title: "e7 App",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    )
);

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Layout"),),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
        },
        child: Icon(Icons.add),
      ),
      body: Stack(
        key: Key("test"),
        alignment: AlignmentDirectional.bottomStart,
        textDirection: TextDirection.rtl,
        fit: StackFit.loose,
        children: [
          Container(width: 300, height: 300, color: Colors.black,),
          Container(width: 200, height: 300, color: Colors.red,),
          Container(width: 250, height: 150, color: Colors.green,),
        ],
      ),
    );
  }
}


