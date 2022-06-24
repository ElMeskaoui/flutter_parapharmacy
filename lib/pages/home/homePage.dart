import 'dart:convert';
import 'package:flutter_parapharmacy/pages/product/productPage.dart';
import 'package:flutter_parapharmacy/pages/search/search.page.dart';
import 'package:flutter_parapharmacy/screens/google_map_screen.dart';
import 'package:image_network/image_network.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
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
      appBar: AppBar(title: Text('Home'),),
      drawer: MyDrawer(),
      body: Center(
        child: Column(
          children: [
            //-------------------------------------------------------------------------------------------------
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 10.0, left: 10.0),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(212, 184, 233, 225),
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        onChanged: (value){
                          setState((){
                            this.query=value;
                          });
                        },
                        controller: queryTextEditingController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 5,top: 13),
                            hintText: "Search ....",
                            suffixIcon: IconButton(onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder:
                                      (context)=>SearchPage(searchTo:query,)));
                            },icon: Icon(Icons.search)))
                            ,
                      ),
                    ),
                  ),
                ),
                IconButton(onPressed: (){
                  setState((){
                    this.queryTextEditingController.clear();
                  });
                }, icon: Icon(Icons.add))
              ],
            ),
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
            //--------------------------------------------------------------------------------------------------
            Expanded(
              child: Column(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Container(
                      height: 350,
                      width: 400,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
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
                                              height: 330,
                                              width: 240,
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
                                                      ClipRRect(
                                                        borderRadius: BorderRadius.circular(40),
                                                        child: Image.network(bestSal[index]['languages']['fr']['poster']['prototype'],
                                                          height: 200,
                                                          width: 200,
                                                        ),
                                                      ),
                                                      Align(
                                                          alignment: Alignment.center,
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 20.0, right: 8.0),
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
                          separatorBuilder: (context, index) => Divider(height: 2,color: Colors.deepOrange,),
                          itemCount: bestSal==null?0:bestSal.length
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
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