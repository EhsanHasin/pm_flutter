import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text("Calculator"),),
      body: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var fn;
  var sn;
  var result;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Calculator", style: TextStyle(fontSize: 30, color: Colors.lightBlue, fontWeight: FontWeight.bold),),
          SizedBox(height: 7,),
          TextField(
            decoration: InputDecoration(
              labelText: "First Number",
              hintText: "Enter the First Number",
              border: OutlineInputBorder()
            ),
            onChanged: (String text){
              fn = text;
            },
          ),
          SizedBox(height: 7,),
          TextField(
            decoration: InputDecoration(
                labelText: "Second Number",
                hintText: "Enter the Second Number",
                border: OutlineInputBorder()
            ),
            onChanged: (text){
              sn = text;
            },
          ),
          SizedBox(height: 7,),
          ElevatedButton(onPressed: (){
            setState(() {
              int ifn = int.parse(fn);
              int isn = int.parse(sn);
              result = ifn + isn;
            });
          }, child: Text("Calculate")),
          SizedBox(height: 7,),
          Text("Result = $result"),
        ],
      ),
    );
  }
}


