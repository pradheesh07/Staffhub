import 'dart:async';
import 'package:flutter/material.dart';
import 'package:staffhub/Home_Page/Loginscreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(const MaterialApp(
    home: Splashscreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          (context), MaterialPageRoute(builder: (context) => const Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            margin: const EdgeInsets.only(bottom: 108),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Align(
                alignment: Alignment.center,
              ),
              Image.asset(
                'assets/logo.png',
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                height: 150,
                width: 150,
              ),
              const SizedBox(
                height: 20,
              ),
              SpinKitThreeBounce(
                color: Colors.green[800],
                size: 35,
              )
            ])));
  }
}
