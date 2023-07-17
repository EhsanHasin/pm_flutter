import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

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

  var tec = TextEditingController();
  var myData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("e7 App"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: tec, decoration: InputDecoration(hintText: "Enter your value"),
            ),
            ElevatedButton(onPressed: () async{

              //getting path
              var directory = await getApplicationDocumentsDirectory();
              //accessing to file
              File file = File("${directory.path}/myFile.txt");
              //writing to the file
              // await file.writeAsString(tec.text+",", mode: FileMode.append);
              await file.writeAsString(tec.text, mode: FileMode.append);
              print(directory.path);

            }, child: Text("Save")),
            ElevatedButton(onPressed: () async{

              //getting path
              var directory = await getApplicationDocumentsDirectory();
              //accessing to file
              File file = File("${directory.path}/myFile.txt");
              //writing to the file
              var temp = await file.readAsString();
              // var tt = temp.substring(0, temp.length-1);
              // List<String> temp2 = tt.split(",");
              setState(() {
                myData = temp;
                // print(temp2);
                print(temp);
              });

            }, child: Text("Restore")),
            Text(myData),
          ],
        ),
      ),
    );
  }
}