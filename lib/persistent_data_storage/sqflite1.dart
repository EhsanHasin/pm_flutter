import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: "e7 App",
    theme: ThemeData(primarySwatch: Colors.blue),
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Database database;
  var nodeId, noteTitle, NoteDescription;
  var tecId = TextEditingController();
  var tecTitle = TextEditingController();
  var tecDescription = TextEditingController();
  List<String> notes = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    openDB();
  }

  openDB() async {
    database = await openDatabase(join(await getDatabasesPath(), "notesDB.db"),
        onCreate: (db, ver) {
        db.execute('''
                  CREATE TABLE notes(
                      not_id INT,
                      not_title TEXT,
                      not_description TEXT,
                      ) 
            ''');
    }, version: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DB App"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "SQLite Database",
                style: TextStyle(fontSize: 30),
              ),
              TextField(
                controller: tecId,
                decoration: InputDecoration(
                    hintText: "Enter Note id", label: Text("Id")),
                onChanged: (id) {
                  this.nodeId = id;
                },
              ),
              TextField(
                controller: tecTitle,
                decoration: InputDecoration(
                    hintText: "Enter Note title", label: Text("Title")),
                onChanged: (title) {
                  this.noteTitle = title;
                },
              ),
              TextField(
                controller: tecDescription,
                decoration: InputDecoration(
                    hintText: "Enter Note Description",
                    label: Text("Description")),
                onChanged: (desc) {
                  this.NoteDescription = desc;
                },
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () async {
                            await database.insert("notes", {
                              "not_id": 1,
                              "not_title": "picnic",
                              "not_description":
                                  "tomorrow we will go to picnic....",
                            });
                          },
                          child: Text("Save Note")),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("List All Notes")),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("Delete by Id")),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("Delete All")),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("Search by id")),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (c, i) {
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.lightBlueAccent,
                          child: Text(notes[i][i]),
                        ),
                        title: Text(
                          notes[i],
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text(
                          notes[i],
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
