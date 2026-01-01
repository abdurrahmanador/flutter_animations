import 'package:flutter/material.dart';

class AnimationClassOne  extends StatefulWidget {
  const AnimationClassOne ({super.key});

  @override
  State<AnimationClassOne> createState() => _AnimationClassOneState();
}

class _AnimationClassOneState extends State<AnimationClassOne > with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller=AnimationController(vsync: this,duration: Duration(seconds: 2));
    _animation=Tween<double>(begin: 0,end: 500).animate(_controller)..addListener((){
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
          width: 200,
          height: _animation.value,
          color: Colors.blue,
        ),
      ),
    );
  }
}
