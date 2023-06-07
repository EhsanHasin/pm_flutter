import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

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

final String REMEMBER_ME = "rememberMe";

class _HomePageState extends State<HomePage> {
  late SharedPreferences preferences;
  String email = "", password = "";
  var data = "";
  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecPassword = TextEditingController();
  String? errorEmail, errorPassword;
  bool cbValue = false;
  bool loaderVisibility = false;
  @override
  void initState() {
    super.initState();

    //checking remember me
    rememberMeChecking();
  }

  rememberMeChecking() async {
    //share preferences
    preferences = await SharedPreferences.getInstance();
    cbValue = preferences.getBool(REMEMBER_ME) ?? false;
    if (cbValue) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) {
        return SecondPage();
      }));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login to e7 App",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: tecEmail,
                decoration: InputDecoration(
                  errorText: errorEmail,
                  label: Text("Email"),
                  border: OutlineInputBorder(),
                ),
                onChanged: (email) {
                  this.email = email;
                  if (email.isNotEmpty) errorEmail = null;
                  setState(() {});
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: tecPassword,
                decoration: InputDecoration(
                    errorText: errorPassword,
                    label: Text("Password"),
                    border: OutlineInputBorder()),
                onChanged: (pass) {
                  password = pass;
                  if (pass.isNotEmpty) errorPassword = null;
                  setState(() {});
                },
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Checkbox(
                      value: cbValue,
                      onChanged: (state) {
                        setState(() {
                          cbValue = state ?? false;
                        });
                      }),
                  Text("Remember Me")
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () async {
                      //form validation: fields should not be empty
                      if (tecEmail.text.isEmpty) {
                        setState(() {
                          errorEmail = "Enter your email";
                        });
                        return;
                      }
                      if (tecPassword.text.isEmpty) {
                        setState(() {
                          errorPassword = "Enter your password";
                        });
                        return;
                      }

                      //form validation: email and password
                      if (email == "Admin" && password == "0000") {
                        //loader
                        setState(() {
                          loaderVisibility = true;
                        });

                        await Future.delayed(Duration(seconds: 3));

                        //share preferences
                        preferences = await SharedPreferences.getInstance();
                        await preferences.setBool(REMEMBER_ME, cbValue);

                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (c) {
                          return SecondPage();
                        }));
                      } else {
                        setState(() {
                          if (email != "Admin") {
                            errorEmail = "Email is incorrect";
                          }
                          if (password != "0000") {
                            errorPassword = "{Password} is incorrect";
                          }
                        });
                      }
                    },
                    child: Text("Log in")),
              ),
              SizedBox(
                height: 15,
              ),
              Visibility(
                  visible: loaderVisibility,
                  child: Shimmer(
                      child: Icon(
                        Icons.downloading,
                        size: 25,
                        color: Colors.lightBlue,
                      ),
                      gradient:
                          LinearGradient(colors: [Colors.yellow, Colors.red])))
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Share Pre App"),
        actions: [
          IconButton(
              onPressed: () async {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                await preferences.setBool(REMEMBER_ME, false);
                Navigator.push(context, MaterialPageRoute(builder: (c) {
                  return HomePage();
                }));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text(
          "Welcome Here!",
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
