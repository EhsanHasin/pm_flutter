import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("e7 App"),),
      body: Container(
        child: IconButton(onPressed: (){
          Share.share('this is an email address. ....', subject: "this is subject");
        }, icon: Icon(Icons.share))
      ),
    );
  }
}