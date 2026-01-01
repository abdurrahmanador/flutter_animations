import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: AnimationDemo ()
    );
  }
}

class AnimationDemo  extends StatefulWidget {
  const AnimationDemo ({super.key});

  @override
  State<AnimationDemo> createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo > with SingleTickerProviderStateMixin{
  
  late AnimationController _controller;
  late Animation<double> _animation;
  
  @override
  void initState() {
    super.initState();
    _controller=AnimationController(vsync: this,duration: Duration(seconds: 2));
    _animation=Tween<double>(begin: 0,end: 300).animate(_controller)..addListener((){
      setState(() {

      });
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation 101')),
      body: Center(
        child: Container(
          width: _animation.value,
          height: 50,
          color: Colors.blue,
        ),
      ),
    );
  }
}
