// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:chewie/chewie.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:video_player/video_player.dart';
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
//   final videoPlayerController = VideoPlayerController.network(
//       'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
//
//   final videoPlayerController2 =
//       VideoPlayerController.asset("assets/videos/vid1.mp4");
//   final videoPlayerController3 =
//       VideoPlayerController.network("https://youtu.be/X-7Ti_oxkSU");
//
//   final videoPlayerController4 =
//   VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4");
//
//   var chewieController = null;
//
//   @override
//   void initState() {
//     super.initState();
//     videoPlayerController.initialize();
//     chewieController = ChewieController(
//         videoPlayerController: videoPlayerController4,
//         autoPlay: true,
//         looping: true,
//         errorBuilder: (c, s) {
//           return Text("the error = $s");
//         },
//         placeholder: Center(
//             child: Shimmer(
//                 child: Icon(
//                   Icons.video_collection_outlined,
//                   size: 120,
//                 ),
//                 gradient: LinearGradient(colors: [Colors.red, Colors.green])))
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("e7 App"),
//       ),
//       body: Container(
//         child: Chewie(controller: chewieController),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     videoPlayerController.dispose();
//     chewieController.dispose();
//     super.dispose();
//   }
// }
