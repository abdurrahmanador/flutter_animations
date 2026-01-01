import 'package:flutter/material.dart';

class AnimationClassThree extends StatefulWidget {
  const AnimationClassThree({super.key});

  @override
  State<AnimationClassThree> createState() => _AnimationClassThreeState();
}

class _AnimationClassThreeState extends State<AnimationClassThree> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller=AnimationController(vsync: this,duration: Duration(seconds: 3));
    _animation=Tween<double>(begin:0,end: 500).animate(CurvedAnimation(parent:_controller, curve:Curves.easeInOut));
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Class Three"),),
      body: AnimatedBuilder(animation: _animation,child: Text("Static Text"), builder: (context,child)=>
      Center(child: Column(children: [
        child!,
        SizedBox(height: 100,),
        Container(width: 500, height:500, color: Colors.green,
        margin: EdgeInsets.only(right:  _animation.value),)
      ],),)),
    );
  }
}
