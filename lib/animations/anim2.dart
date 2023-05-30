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
  var opt = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("e7 App"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        // if(opt == 0.0) opt = 1.0;
        // else opt = 0.0;

        opt = opt == 0.0 ? 1.0 : 0.0;

        setState(() {});
      }),
      body: Center(
        child: Container(
            child: AnimatedOpacity(
          opacity: opt,
          duration: Duration(seconds: 1),
              child: Image.asset("assets/images/picture.jpg"),
              curve: Curves.bounceIn,
        )),
      ),
    );
  }
}
