import 'package:flutter/material.dart';

class AnimationClassTwo extends StatefulWidget {
  const AnimationClassTwo({super.key});

  @override
  State<AnimationClassTwo> createState() => _AnimationClassTwoState();
}

class _AnimationClassTwoState extends State<AnimationClassTwo> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller=AnimationController(vsync: this,duration: Duration(seconds: 2));
    _animation=Tween<double>(begin:0,end:500).animate(_controller);
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
      appBar: AppBar(title: Text('Animation Second class')),
      body: AnimatedBuilder(
          child:Text("Hi this is static Data"),
          animation: _animation, builder:(context,child){
        return Center(
          child: Column(
            children:[
              child!,
              SizedBox(height: 100,),
              Container(
                width: 500,
                height: _animation.value,
                color: Colors.red,
              ),
            ]
          ),
        );

      }),
    );
  }
}
