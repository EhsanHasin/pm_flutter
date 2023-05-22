import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();
            }, child: Text("alert #1")),
            ElevatedButton(onPressed: (){
              Alert(
                context: context,
                type: AlertType.error,
                title: "RFLUTTER ALERT",
                desc: "Flutter is more awesome with RFlutter Alert.",
                buttons: [
                  DialogButton(
                    child: Text(
                      "COOL",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () => Navigator.pop(context),
                    width: 120,
                  )
                ],
              ).show();
            }, child: Text("alert #2")),
            ElevatedButton(onPressed: (){
              Alert(
                context: context,
                type: AlertType.warning,
                title: "RFLUTTER ALERT",
                desc: "Flutter is more awesome with RFlutter Alert.",
                buttons: [
                  DialogButton(
                    child: Text(
                      "FLAT",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () => Navigator.pop(context),
                    color: Color.fromRGBO(0, 179, 134, 1.0),
                  ),
                  DialogButton(
                    child: Text(
                      "GRADIENT",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () => Navigator.pop(context),
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(116, 116, 191, 1.0),
                      Color.fromRGBO(52, 138, 199, 1.0)
                    ]),
                  )
                ],
              ).show();
            }, child: Text("alert #3")),
          ],
        ),
      ),
    );
  }
}