import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_parapharmacy/pages/home/homePage.dart';
import 'package:flutter_parapharmacy/screens/signin_screen.dart';

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 6),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Image.network('https://media.giphy.com/media/lPeXaPf2H53EHkz5yJ/giphy.gif', width: 200, height: 200,)
                    ),
              Text("data")
            ],
          ),
        ),

      ),
    );
  }
}
