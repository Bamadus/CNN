import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../routes/login_page.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  var _visible = true;
  late AnimationController animationController;
  late Animation<double> animation;

  startTime() {
    var duration = const Duration(seconds: 1);
    return Timer(duration, () {
      if (mounted) {
        Timer(const Duration(seconds: 4), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Login_screen()));
        });
      }
    });
  }

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation.addListener(() => setState(() {}));
    animationController.forward();
    setState(() {
      _visible = !_visible;
    });
    startTime();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Color(0xffabc4ff),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: SizedBox(
                height: 250,
                width: 150,
                child: Column(
                  children: [
                    // Image.asset(
                    //   "assets/images/.png",
                    //   height: animation.value * 300,
                    //   width: animation.value * 300,
                    // ),
                    SizedBox(height: animation.value * 10),
                    Text("Welcome to BaMaDuS!!!",
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Color(0xff33415c),
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  "BaMaDuS News App",
                  style: TextStyle( fontFamily: 'SourceSansPro',
                      color: Color(0xff33415c),fontSize: 25, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 5),
                Text(
                  "Never miss a news update...",
                  style: TextStyle( fontFamily: 'SourceSansPro',
                      color: Color(0xff33415c),fontSize: 21),
                ),
                SizedBox(height: 30),
              ],
            ),
          )
        ],
      ),
    );
  }
}