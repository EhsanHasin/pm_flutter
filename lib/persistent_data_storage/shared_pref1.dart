import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final String KEY_FIRST_NAME = "first_name";
final String KEY_LAST_NAME = "last_name";
final String KEY_AGE = "age";

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
  var firstName, lastName, age;
  var data = "";
  late SharedPreferences preferences;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("e7 App"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Shared Preferences",
                style: TextStyle(fontSize: 30),
              ),
              TextField(
                decoration: InputDecoration(hintText: "First Name"),
                onChanged: (fn) {
                  firstName = fn;
                },
              ),
              TextField(
                decoration: InputDecoration(hintText: "Last Name"),
                onChanged: (ln) {
                  lastName = ln;
                },
              ),
              TextField(
                decoration: InputDecoration(hintText: "age"),
                onChanged: (age) {
                  this.age = age;
                },
              ),
              ElevatedButton(
                  onPressed: () async{
                    preferences = await SharedPreferences.getInstance();
                    await preferences.setString(KEY_FIRST_NAME, firstName);
                    await preferences.setString(KEY_LAST_NAME, lastName);
                    await preferences.setString(KEY_AGE, age);
                  },
                  child: Text("Save")),
              ElevatedButton(
                  onPressed: () async{
                    preferences = await SharedPreferences.getInstance();
                    firstName = preferences.get(KEY_FIRST_NAME) ?? "No_Name";
                    lastName = preferences.get(KEY_LAST_NAME) ?? "No_Last_Name";
                    age = preferences.get(KEY_AGE) ?? "No_Age";
                    setState(() {
                      data = "Hi $firstName $lastName, You are $age years old.";
                    });
                  },
                  child: Text("Restore")),
              Text(
                "data = $data",
                style: TextStyle(fontSize: 30),
              ),
              ElevatedButton(onPressed: (){}, child: Text("Delete")),
            ],
          ),
        ),
      ),
    );
  }
}
