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
  var state = CrossFadeState.showFirst;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("e7 App"),
          actions: [
            IconButton(
                onPressed: () {
                  state = CrossFadeState.showFirst;
                  setState(() {});
                },
                icon: Icon(Icons.person)),
            IconButton(
                onPressed: () {
                  state = CrossFadeState.showSecond;
                  setState(() {});
                },
                icon: Icon(Icons.woman)),
          ],
        ),
        body: Center(
          child: Container(
            child: AnimatedCrossFade(
              firstChild: Image.asset("assets/prince.png"),
              secondChild: Image.asset("assets/princess.png"),
              crossFadeState: state,
              duration: Duration(seconds: 3),
            ),
          ),
        ));
  }
}
