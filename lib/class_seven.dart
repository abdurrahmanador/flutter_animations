import 'package:flutter/material.dart';


class AnimationClassSeven extends StatefulWidget {
  const AnimationClassSeven({super.key});

  @override
  State<AnimationClassSeven> createState() => _AnimationClassSevenState();
}

class _AnimationClassSevenState extends State<AnimationClassSeven> with SingleTickerProviderStateMixin{

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
    ).animate(CurvedAnimation(parent: _controller, curve: Interval(0, 1,curve: Curves.easeIn)));
    _widthAnimation = Tween<double>(
      begin: 0,
      end: 1000,
    ).animate(CurvedAnimation(parent: _controller, curve: Interval(0.5, 1,curve: Curves.easeInOut)));
    _colorAnimation = ColorTween(
      begin: Colors.yellow,
      end: Colors.black,
    ).animate(_controller);


  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Class 7")),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onVerticalDragUpdate: (details){
          _controller.value+=details.primaryDelta!/300;
          _controller.value=_controller.value.clamp(0.0, 1.0);
        },
        onVerticalDragEnd: (details){
          if(_controller.value>=0.5){
            _controller.forward();
        }else{
            _controller.reverse();
          }
        },
        child: AnimatedBuilder(
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
      ),
    );
  }

}
