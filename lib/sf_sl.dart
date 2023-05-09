import 'package:flutter/material.dart';
void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyStateLessApp(),
              MyStateFullApp(),
              // Icon(Icons.add_alert_sharp),
              // MyIcon(),
              // MyText(),
              // MyStyledText(),
              // MyIcon(),
            ],
          ),
        ),
      ),
    )
  );
}

//---------------------------

class MyText extends StatelessWidget {
  const MyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("This is my Text...");
  }
}

class MyIcon extends StatelessWidget {
  const MyIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.ac_unit_outlined, size: 80,);
  }
}

class MyStyledText extends StatelessWidget {
  const MyStyledText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Styled Text", style: TextStyle(fontSize: 50, color: Colors.red),);
  }
}

class MyStateLessApp extends StatelessWidget {
  MyStateLessApp({Key? key}) : super(key: key);
  var count = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Number of Clicked = $count"),
        ElevatedButton(onPressed: (){
          count++;
        }, child: Text("Click me"))
      ],
    );
  }
}

//---------------------------

class MyStateFullApp extends StatefulWidget {
  const MyStateFullApp({Key? key}) : super(key: key);

  @override
  State<MyStateFullApp> createState() => _MyStateFullAppState();
}

class _MyStateFullAppState extends State<MyStateFullApp> {
  var count = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Number of Clicked = $count"),
        ElevatedButton(onPressed: (){
          setState(() {
            count++;
          });
        }, child: Text("Click me"))
      ],
    );
  }
}



