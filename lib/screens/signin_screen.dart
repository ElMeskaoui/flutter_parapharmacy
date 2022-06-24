import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_parapharmacy/pages/home/homePage.dart';
import 'package:flutter_parapharmacy/pages/product/productPage.dart';

import 'google_map_screen.dart';
import 'package:http/http.dart' as http;
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage2(),
    );
  }
}

class HomePage2 extends StatefulWidget {
  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {

  dynamic bestSal;
  TextEditingController queryTextEditingController=new TextEditingController();
  ScrollController scrollController=new ScrollController();
  String query="";
  bool notVisible=false;
  @override
  void initState(){
    setState((){
      _bestSaler();
    });
  }

  Future<void> _bestSaler() async {
    String url="https://theparapharmacy.ca/api/1/products/topSellers";
    await http.get(Uri.parse(url)).then((data){
      setState((){
        this.bestSal=jsonDecode(data.body);
      });
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                // Search Bar
                Container(
                  margin: EdgeInsets.only(top: 10.0, left: 10.0),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(212, 184, 233, 225),
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
                        "Top Sellers",
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

                //-----------------------------------------------------------------------Best sale
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index){
                                return SingleChildScrollView(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 320,
                                                  width: 300,
                                                  child: InkWell(
                                                    onTap: (){
                                                      Navigator.push(context,
                                                          MaterialPageRoute(builder:
                                                              (context)=>ProductPage(id:bestSal[index]['id'],)));
                                                    },
                                                    child: Card(
                                                      shadowColor: Colors.black,
                                                      elevation: 10,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(32)),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(32),
                                                          // ignore: prefer_const_literals_to_create_immutables
                                                        ),
                                                        child: Column(children: [
                                                          Image.network(bestSal[index]['languages']['fr']['poster']['prototype'],
                                                            height: 220,
                                                            width: 200,
                                                          ),
                                                          Align(
                                                              alignment: Alignment.center,
                                                              child: Padding(
                                                                padding: const EdgeInsets.only(left: 20.0),
                                                                child: Text(
                                                                  "${bestSal[index]['languages']['fr']['name']}",
                                                                  style: TextStyle(
                                                                    fontSize: 20.0,
                                                                    fontFamily: "Andika",
                                                                    fontWeight: FontWeight.bold,
                                                                    letterSpacing: 1.5,
                                                                  ),
                                                                ),
                                                              ))
                                                        ]),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                              itemCount: bestSal==null?0:bestSal.length
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //-=====================================================================================================================================================================================================================================================================================================================================================================================
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

                // Categorie 1---------------------------------------------------
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    color: Color.fromARGB(100, 92, 255, 230),
                  ),
                  margin: EdgeInsets.only(left: 8.0),
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Great Deals for Everyday Life",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: "PlayfairDisplay",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
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
                                        child: Text(
                                          "Vital Humic ",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: "VarelaRound",
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.5,
                                          ),
                                        ))
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
                                        child: Text("Aromavita 49",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: "VarelaRound",
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.5,
                                            )))
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
                                        child: Text("Forsight",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: "VarelaRound",
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.5,
                                            )))
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
                                        child: Text("Moringa",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: "VarelaRound",
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.5,
                                            )))
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
                // Categorie 2---------------------------------------------------
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    color: Color.fromARGB(100, 92, 255, 230),
                  ),
                  margin: EdgeInsets.only(left: 8.0),
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Detox",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: "PlayfairDisplay",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
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
                                      'images/4.png',
                                      height: 300,
                                      width: 250,
                                    ),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Hepamed ",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: "VarelaRound",
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.5,
                                          ),
                                        ))
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
                                      'images/5.png',
                                      height: 300,
                                      width: 250,
                                    ),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Text("Spring/Fall Detox",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: "VarelaRound",
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.5,
                                            )))
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
                                      'images/6.png',
                                      height: 300,
                                      width: 250,
                                    ),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Text("Detoxification",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: "VarelaRound",
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.5,
                                            )))
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
                                      'images/i6.png',
                                      height: 300,
                                      width: 250,
                                    ),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Text("Drainaflore Detox",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: "VarelaRound",
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.5,
                                            )))
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
                // Categorie 3-----------------------------------
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    color: Color.fromARGB(100, 92, 255, 230),
                  ),
                  margin: EdgeInsets.only(left: 8.0),
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Cosmeti",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: "PlayfairDisplay",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
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
                                      'images/7.png',
                                      height: 300,
                                      width: 250,
                                    ),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "L-Lysine Powder",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: "VarelaRound",
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.5,
                                          ),
                                        ))
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
                                      'images/8.png',
                                      height: 300,
                                      width: 250,
                                    ),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Text("Collagen Beauty",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: "VarelaRound",
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.5,
                                            )))
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
                                      'images/9.png',
                                      height: 300,
                                      width: 250,
                                    ),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Text("Forsight",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: "VarelaRound",
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.5,
                                            )))
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
                                      'images/10.png',
                                      height: 300,
                                      width: 250,
                                    ),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Text("Moringa",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: "VarelaRound",
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.5,
                                            )))
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
          ),
        ),
        //
        //
        //icons maps:
          floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GoogleMapScreen(),
              )),
          tooltip: 'Increment',
          child: const Icon(Icons.pin_drop_rounded),
        )
        );
  }
}

// ignore: use_key_in_widget_constructors
class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(
              color: Color.fromARGB(255, 124, 208, 219),
              child: Image.asset(
                'images/logo1.png',
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                )),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.email_sharp),
            title: Text('Contact US'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.pin_drop_rounded),
            title: Text('Google Maps'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GoogleMapScreen(),
                )),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.more_horiz),
            title: Text('More'),
            onTap: () => null,
          )
        ],
      ),
    );
  }
}
