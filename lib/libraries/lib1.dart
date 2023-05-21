import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.fish),
              FaIcon(FontAwesomeIcons.apple, size: 90, color: Colors.blueGrey,),
              FaIcon(FontAwesomeIcons.crop, size: 90, color: Colors.blueGrey,),
              FaIcon(FontAwesomeIcons.powerOff, size: 90, color: Colors.blueGrey,),
              FaIcon(FontAwesomeIcons.bitbucket, size: 90, color: Colors.blueGrey,),
              FaIcon(FontAwesomeIcons.baby, size: 90, color: Colors.blueGrey,),
            ],
          ),
        ),
      ),
    );
  }
}