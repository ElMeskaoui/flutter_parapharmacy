import 'dart:async';

import 'package:flutter/material.dart';
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
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyApp())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 49, 132, 204),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Stack(alignment: Alignment.center, children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 90,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage('images/logo1.png'),
                  width: 500,
                  height: 500,
                ),
              ),
            ),
          ]),
          SizedBox(
            height: 5,
          ),
          Text('ParaPharmacy',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25))
        ]),
      ),
    );
  }
}