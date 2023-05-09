import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "e7 App",
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var myTitle = "Demo Application";
  var w = 100.0, h = 100.0;
  var colors = [Colors.red, Colors.yellow, Colors.blue, Colors.green, Colors.orange];
  var myColor = Colors.lightGreen;

  var myTop = 40.0;
  var myLeft = 90.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(myTitle),
      ),
      body: Stack(
        children: [
          Positioned(
            top: myTop,
            left: myLeft,
            child: GestureDetector(
              onTap: (){
                myTitle = "Single Clicked";
                setState(() {});
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Clicked")));

                // w = w + 50;
                // h = h + 50;
                myColor = colors[Random().nextInt(colors.length)];

                myLeft = myLeft + 10;
                myTop = myTop + 10;

              },
              onDoubleTap: (){
                myTitle = "Double Clicked";
                setState(() {});
              },
              onLongPress: (){
                myTitle = "onLongPressed";
                setState(() {});
              },
              onPanUpdate: (ud){

                myLeft = myLeft + ud.delta.dx;
                myTop = myTop + ud.delta.dy;

                if(myLeft < 0 || myTop < 0){
                  myColor = Colors.red;
                }else{
                  myColor = colors[Random().nextInt(colors.length)];
                }

                setState(() {});

              },
              child: Container(
                width: 200,
                height: 200,
                color:myColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
