import 'package:flutter/material.dart';
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

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("e7 App"),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        controller.forward();
        controller.repeat(reverse: true);
      }),
      body: Center(
        child: GestureDetector(
          onTap: (){
            controller.forward();
          },
          onDoubleTap: (){
            controller.reverse();
          },
          onLongPress: (){
            controller.repeat();
          },
          child: AnimatedIcon(
            color: Colors.greenAccent,
            icon: AnimatedIcons.play_pause,
            progress: animation,
            size: 150,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

}