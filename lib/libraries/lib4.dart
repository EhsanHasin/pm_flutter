// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:english_words/english_words.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:text_to_speech/text_to_speech.dart';
//
// void main() => runApp(MaterialApp(
//       title: "e7 App",
//       theme: ThemeData(primarySwatch: Colors.blue),
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     ));
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("e7 App"),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (c) => RandomWord()));
//               },
//               icon: Icon(FontAwesomeIcons.shuffle))
//         ],
//       ),
//       body: Container(
//         child: ListView.builder(
//             itemCount: 100,
//             itemBuilder: (c, i) {
//               return ListTile(
//                 title: Text(
//                   "${nouns[i]} - ${adjectives[i]}",
//                   style: TextStyle(fontSize: 30),
//                 ),
//               );
//             }),
//       ),
//     );
//   }
// }
//
// class RandomWord extends StatefulWidget {
//   RandomWord({Key? key}) : super(key: key);
//
//   @override
//   State<RandomWord> createState() => _RandomWordState();
// }
//
// class _RandomWordState extends State<RandomWord> {
//   var generatedWord = adjectives[Random().nextInt(500)];
//   var colors = [
//     Colors.red,
//     Colors.green,
//     Colors.blue,
//     Colors.yellow,
//     Colors.orange
//   ];
//   var generatedWordWithFirstLetterUppercase;
//   TextToSpeech tts = TextToSpeech();
//   @override
//   void initState() {
//     generatedWordWithFirstLetterUppercase = generatedWord.replaceFirst(generatedWord[0], generatedWord[0].toUpperCase(), 0);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: GestureDetector(
//             onTap: (){
//               tts.speak(generatedWordWithFirstLetterUppercase);
//             },
//             onDoubleTap: (){
//               Navigator.pop(context);
//             },
//             child: Text(
//               generatedWordWithFirstLetterUppercase,
//         style: TextStyle(
//               fontSize: 120, color: colors[Random().nextInt(colors.length)]),
//       ),
//           )),
//     );
//   }
// }
