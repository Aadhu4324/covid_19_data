import 'package:covid_app/screens/screen_splash.dart';
import 'package:flutter/material.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _controller.repeat();
    Future.delayed(Duration(seconds: 3), () {
      _controller.dispose();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Screenhome(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => Transform.rotate(
            angle: _controller.value * 2,
            child: child,
          ),
          child: Image.asset("images/virustwo.jpeg"),
        ),
      ),
    );
  }
}
