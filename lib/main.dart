// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // Search Bar
              Container(
                margin: EdgeInsets.only(top: 10.0, left: 10.0),
                decoration: BoxDecoration(
                    color: Color.fromARGB(100, 299, 299, 299),
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        errorBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 5),
                        hintText: "Search Categories",
                        icon: Icon(Icons.search)),
                  ),
                ),
              ),
              // Categories
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Categorie",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: "Andika",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              // Categorie 1
              Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "data",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: "PlayfairDisplay",
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  color: Color.fromARGB(100, 92, 255, 230),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Card(
                              shadowColor: Colors.black,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32)),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(32),
                                    // ignore: prefer_const_literals_to_create_immutables
                                    gradient: LinearGradient(
                                        // ignore: prefer_const_literals_to_create_immutables
                                        colors: [
                                          Color.fromARGB(212, 242, 253, 251),
                                          Color.fromARGB(213, 130, 221, 206)
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter)),
                                child: Column(children: [
                                  Image.asset(
                                    'images/i1.png',
                                    height: 300,
                                    width: 250,
                                  ),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Text("Vital Humic "))
                                ]),
                              ),
                            ),
                            Card(
                              shadowColor: Colors.black,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32)),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(32),
                                    // ignore: prefer_const_literals_to_create_immutables
                                    gradient: LinearGradient(
                                        // ignore: prefer_const_literals_to_create_immutables
                                        colors: [
                                          Color.fromARGB(212, 242, 253, 251),
                                          Color.fromARGB(213, 130, 221, 206)
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter)),
                                child: Column(children: [
                                  Image.asset(
                                    'images/i2.png',
                                    height: 300,
                                    width: 250,
                                  ),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Text("Aromavita 49"))
                                ]),
                              ),
                            ),
                            Card(
                              shadowColor: Colors.black,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32)),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(32),
                                    // ignore: prefer_const_literals_to_create_immutables
                                    gradient: LinearGradient(
                                        // ignore: prefer_const_literals_to_create_immutables
                                        colors: [
                                          Color.fromARGB(212, 242, 253, 251),
                                          Color.fromARGB(213, 130, 221, 206)
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter)),
                                child: Column(children: [
                                  Image.asset(
                                    'images/3.png',
                                    height: 300,
                                    width: 250,
                                  ),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Text("Forsight"))
                                ]),
                              ),
                            ),
                            Card(
                              shadowColor: Colors.black,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32)),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(32),
                                    // ignore: prefer_const_literals_to_create_immutables
                                    gradient: LinearGradient(
                                        // ignore: prefer_const_literals_to_create_immutables
                                        colors: [
                                          Color.fromARGB(212, 242, 253, 251),
                                          Color.fromARGB(213, 130, 221, 206)
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter)),
                                child: Column(children: [
                                  Image.asset(
                                    'images/i3.png',
                                    height: 300,
                                    width: 250,
                                  ),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Text("Moringa"))
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

// ignore: use_key_in_widget_constructors
class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Drawer();
  }
}
