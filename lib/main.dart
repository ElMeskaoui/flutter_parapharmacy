import 'package:flutter/material.dart';
import 'package:flutter_parapharmacy/screens/splash_screen.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
