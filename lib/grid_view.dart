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

  var photos = [
    "assets/images/calendar.png",
    "assets/images/picture.jpg",
    "assets/books.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("e7 App"),
      ),
      body: GridView.builder(
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: photos.length,
          itemBuilder: (bc, index) {
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (con)=>FullScreenPhoto(photo: photos[index],)));
              },
              child: GridTile(
                header: Icon(Icons.more_horiz),
                footer: Center(child: Text("Foo: 120X300")),
                child: Image.asset(
                  photos[index],
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
    );
  }
}

class FullScreenPhoto extends StatelessWidget {

  FullScreenPhoto({Key? key, this.photo}) : super(key: key);

  var photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Image.asset(photo, width: double.infinity, height: double.infinity, fit: BoxFit.contain,)),
    );
  }
}

