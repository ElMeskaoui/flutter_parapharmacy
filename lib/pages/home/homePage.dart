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
  dynamic products;
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
    String urlP="https://theparapharmacy.ca/api/1/categories/64/products";
    await http.get(Uri.parse(url)).then((data){
      setState((){
        this.bestSal=jsonDecode(data.body);
      });
    });
    await http.get(Uri.parse(urlP)).then((value){
      setState((){
        this.products=jsonDecode(value.body);
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
                }, icon: Icon(Icons.clear))
              ],
            ),
            //-----------------------------TopSellers;;;;
            Container(
              margin: EdgeInsets.only(top: 9),
              color: Color.fromARGB(212, 184, 233, 225),
              child: Padding(
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
            ),
            //--------------------------------------------------------------------------------------------------
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 230,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                            return SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 220,
                                                  width: 220,
                                                  child: InkWell(
                                                    onTap: (){
                                                      Navigator.push(context,
                                                          MaterialPageRoute(builder:
                                                              (context)=>ProductPage(id:bestSal[index]['id'],)));
                                                    },
                                                    child: Card(
                                                      shadowColor: Colors.black,
                                                      elevation: 8,
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
                                                              height: 130,
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
                                                                    fontSize: 15.0,
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
                                  //---------------------------------------------000000000000000000000------------------------

                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => Divider(height: 2,color: Colors.deepOrange,),
                          itemCount: bestSal==null?0:bestSal.length
                      ),
                    ),
                    Container(
                      color: Color.fromARGB(212, 184, 233, 225),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
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
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          height: 300,
                          width: 500,
                          child: Center(
                            child:SingleChildScrollView(
                              child: Column(
                                children: [
                                  ListView.separated(
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index)=>Container(
                                        // width: MediaQuery.of(context).size.width,
                                        width: 200,
                                        height: 130,
                                        child: InkWell(
                                            onTap: (){
                                              Navigator.push(context,
                                                  MaterialPageRoute(builder:
                                                      (context)=>ProductPage(id:products[index]['id'],)));
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(15),
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(color: Color.fromARGB(212, 184, 233, 225), spreadRadius: 3),
                                                          ],
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Image.network('${products[index]["languages"]["fr"]["poster"]["prototype"]}',),
                                                        )),),
                                                  SizedBox(width: 18,),
                                                  Expanded(
                                                    child: Align(
                                                      alignment: Alignment.center,
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(15.0),
                                                        child: Text("${products[index]["languages"]["fr"]["name"]}",style: TextStyle(fontSize: 17,fontFamily: "Andika"),
                                                          overflow: TextOverflow.ellipsis,
                                                          maxLines: 3,),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ),
                                      separatorBuilder: (context, index)=> Divider(height: 9, color: Color.fromARGB(212, 184, 233, 225)),
                                      itemCount: products==null?0:products.length)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )


                  ],


                ),
              ),
            ),
            //--------------------------------------------------------------------Categoris:::


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
      child: Container(
        color: Color.fromARGB(255, 124, 208, 219),
        child: Column(
          children: [
            Container(
              height: 300,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 124, 208, 219),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    margin: EdgeInsets.only(top: 1),
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: Image.asset(
                      'images/logo1.png',
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              height: 575,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40),),
              ),
              child: Column(
                children: [
                  //Home
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 8),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 124, 208, 219),
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: InkWell(
                      onTap:() => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          )),
                      child: Row(
                        children: [
                          SizedBox(width: 37,),
                          Icon(Icons.home),
                          SizedBox(width: 30,),
                          Text('Home',
                            style: TextStyle(fontSize: 20, fontFamily: "Andika"),),
                        ],
                      ),
                    ),
                  ),
                  //Localisation
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 8),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 124, 208, 219),
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GoogleMapScreen(),
                          )),
                      child: Row(
                        children: [
                          SizedBox(width: 37,),
                          Icon(Icons.pin_drop_rounded),
                          SizedBox(width: 30,),
                          Text('Google Maps',
                            style: TextStyle(fontSize: 20, fontFamily: "Andika"),),
                        ],
                      ),
                    ),
                  ),
                  //Contact
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 8),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 124, 208, 219),
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: InkWell(
                      onTap:() => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          )),
                      child: Row(
                        children: [
                          SizedBox(width: 37,),
                          Icon(Icons.email_sharp),
                          SizedBox(width: 30,),
                          Text('Contact US',
                          style: TextStyle(fontSize: 20, fontFamily: "Andika"),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}