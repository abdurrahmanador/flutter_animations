import 'package:flutter/material.dart';


class AnimationClassFive extends StatefulWidget {
  const AnimationClassFive({super.key});

  @override
  State<AnimationClassFive> createState() => _AnimationClassFiveState();
}

class _AnimationClassFiveState extends State<AnimationClassFive> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _heightAnimation;
  late Animation<double> _widthAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _heightAnimation = Tween<double>(
      begin: 0,
      end: 500,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _widthAnimation = Tween<double>(
      begin: 0,
      end: 1000,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _colorAnimation = ColorTween(
      begin: Colors.yellow,
      end: Colors.black,
    ).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
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
      appBar: AppBar(title: Text("Class 5: Ping-Pong Animation")),
      body: AnimatedBuilder(
        animation: _controller,
        child: Text("Static Text"),
        builder: (context, child) => Center(
          child: Column(
            children: [
              child!,
              SizedBox(height: 100),
              Container(
                width: _widthAnimation.value,
                height: _heightAnimation.value,
                color: _colorAnimation.value,
              ),
            ],
          ),
        ),
      ),
    );
  }

}
