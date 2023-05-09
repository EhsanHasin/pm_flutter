import 'package:flutter/material.dart';
void main(){
  // var t = new Text("In the name of Allah", textDirection: TextDirection.ltr,);
  // var b = new ElevatedButton(onPressed: null, child: t);
  // var m = new MaterialApp(home: b,);
  runApp(MaterialApp(
    home: Container(
      color: Colors.amber,
      child: Center(
        child: Text(
          "Hello Flutter",
          style: TextStyle(
              fontSize: 60.0,
              color: Colors.green
          ),
        ),
      ),
    ),
  ));
}
