import 'package:flutter/material.dart';
void main() => runApp(
    MaterialApp(
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
  var myTitle = "Flutter is great";
  var selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(myTitle),),
      body: ListView(
        // This next line does the trick.
        children: <Widget>[
         ListTile(
           title: Text("Ahmad Ahmadi"),
           subtitle: Text("Developer"),
           leading: Icon(Icons.ac_unit),
           trailing: Icon(Icons.arrow_forward),
           selected: true,
           splashColor: Colors.black87,
           hoverColor: Colors.red,
           focusColor: Colors.orange,
           selectedTileColor: Colors.green,
           selectedColor: Colors.purple,
           textColor: Colors.yellow,
           onTap: (){
             setState(() {
               myTitle = "single clicked done";
             });
           },
           onLongPress: (){
             setState(() {
               myTitle = "long pressed done";
             });
           },
         ),
         ListTile(
           title: Text("Ahmad Ahmadi"),
           subtitle: Text("Developer"),
           leading: Icon(Icons.ac_unit),
           trailing: Icon(Icons.arrow_forward),
           selected: false,
           textColor: Colors.yellow,
           onTap: (){
             setState(() {
               myTitle = "single clicked done";
             });
           },
           onLongPress: (){
             setState(() {
               myTitle = "long pressed done";
             });
           },
         ),
          MaterialButton(onPressed: (){}, child: Text("Click me"), color: Colors.lightGreen,),
          ListTile(
            title: Text("Ahmad Ahmadi"),
            subtitle: Text("Developer"),
            leading: Icon(Icons.ac_unit),
            trailing: Icon(Icons.arrow_forward),
            selected: selected,
            onTap: (){
              setState(() {
                myTitle = "single clicked done";
                if(selected == true) selected = false;
                else selected = true;

                //selected = selected ? false : true;

              });
            },
          ),
          ListTile(
            title: Text("Ahmad Ahmadi"),
            subtitle: Text("Developer"),
            leading: Icon(Icons.ac_unit),
            trailing: Icon(Icons.arrow_forward),
            selected: false,
            onTap: (){
              setState(() {
                myTitle = "single clicked done";
              });
            },
          ),
          ListTile(
            title: Text("Ahmad Ahmadi"),
            subtitle: Text("Developer"),
            leading: Icon(Icons.ac_unit),
            trailing: Checkbox(value: selected, onChanged: (s){
              setState(() {
                selected = s!;
              });
            }),
            selected: selected,
            onTap: (){
              setState(() {
                myTitle = "single clicked done";
                selected = selected ? false : true;
              });
            },
          ),
        ],
      ),
    );
  }
}