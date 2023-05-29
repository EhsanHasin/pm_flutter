import 'dart:math';

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
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var w = 100.0, h = 100.0;
  var col = Colors.red;
  var colors = [Colors.green, Colors.blue, Colors.purple];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("e7 App"),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        w = w + 50;
        h = h + 50;
        col = colors[Random().nextInt(colors.length)];
        setState(() {});
      }),
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        width: w,
        height: 30,
        color: col,
        curve: Curves.bounceOut,
        onEnd: (){
          col = Colors.red;
          setState(() {});
        },
      ),
    );
  }
}