import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_parapharmacy/pages/product2/productPage2.dart';
import 'package:http/http.dart' as http;


class SearchPage extends StatefulWidget{

  String? searchTo;
  SearchPage({required this.searchTo});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  dynamic listSearched;
  dynamic productsDetails;


  @override
  void initState(){
    setState((){
      _loadSearch();
    });
    }
  Future<dynamic>  _loadSearch() async{

    String url="https://www.apollopharmacy.in/_next/data/1656006835640/search-medicines/${widget.searchTo}.json?text=${widget.searchTo}";
    http.Response reponce = await http.get(Uri.parse(url));
    if(reponce.statusCode==200){
      setState((){
        listSearched=jsonDecode(reponce.body);
        productsDetails=listSearched["pageProps"]["productsDetails"];
      });
    }
    return listSearched;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.searchTo}")),
      body: FutureBuilder(
        future: _loadSearch(),
        builder:
            (BuildContext context, AsyncSnapshot usnapshot) {
          if (usnapshot.hasData) {
            return Center(
              child:SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.separated(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index)=>Container(
                          width: MediaQuery.of(context).size.width,
                          child: InkWell(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder:
                                        (context)=>ProductPage2(url_key:productsDetails[index]['url_key'],)));
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
                                            child: Image.network('https://newassets.apollo247.com/pub/media/${productsDetails[index]['thumbnail']}',),
                                          )),),
                                    SizedBox(width: 18,),
                                    Expanded(
                                      child: Align(
                                          alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Text("${productsDetails[index]["name"]}",style: TextStyle(fontSize: 17,fontFamily: "Andika"),
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
                        itemCount: productsDetails==null?0:productsDetails.length)
                  ],
                ),
              ),
            );
          } else {
            return Container(
              width: double.infinity,
              child:Center(child: CircularProgressIndicator(
                color: Colors.blueAccent,
              ),),);
          }
        },
      ),
    );
  }
}

