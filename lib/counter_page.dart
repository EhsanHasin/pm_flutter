import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.light
    ),
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var c = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.lightGreen,
          child: Text("Number of Clicked = $c"),
        ),
      ),
      appBar: AppBar(
        title: Text("Counter Application"),
        leading: Icon(Icons.add_alert_sharp),
        actions: [
          IconButton(
            onPressed: (){
              print("clicked....");
            },
            icon: Icon(Icons.more_vert_outlined),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            c++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}








