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
  var l = 0.0, t = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("e7 App"),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: (){
      //   t = t + 10;
      //   l = l + 10;
      //   setState(() {});
      // }),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: Stack(children: [
                AnimatedPositioned(
                  top: t,
                  left: l,
                  child: Container(width: 100, height: 100, color: Colors.red),
                  duration: Duration(milliseconds: 300),
                  curve: Curves.bounceOut,
                )
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: (){
                  l = l - 100;
                  setState(() {});
                }, icon: Icon(Icons.arrow_back)),
                IconButton(onPressed: (){
                    t = t - 100;
                    setState(() {});
                }, icon: Icon(Icons.arrow_upward)),
                IconButton(onPressed: (){
                  t = t + 100;
                  setState(() {});
                }, icon: Icon(Icons.arrow_downward)),
                IconButton(onPressed: (){
                  l = l + 100;
                  setState(() {});
                }, icon: Icon(Icons.arrow_forward)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
