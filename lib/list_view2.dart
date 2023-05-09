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

  var phnes = ["Samsung", "iPhone", "Xiomi", "Nokia", "LG"];
  var icons = [Icons.ac_unit, Icons.add_alert, Icons.close, Icons.abc, Icons.access_time];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("e7 App"),
      ),
      body: ListView.builder(
          itemCount: phnes.length,
          itemBuilder: (bc, i) {
            return ListTile(
              title: Text(phnes[i]),
              subtitle: Text("Developer"),
              leading: Icon(icons[i]),
              trailing: Icon(Icons.arrow_forward),
              selected: false,
              onTap: () {
                setState(() {
                  print("index = $i");
                });
              },
            );
          }),
    );
  }
}
