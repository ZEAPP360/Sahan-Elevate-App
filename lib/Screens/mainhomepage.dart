import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

import '../home_api.dart';

class MainHomePage extends StatefulWidget {
    String? token2;

  MainHomePage({this.token2,super.key});

  @override
  // ignore: no_logic_in_create_state
  State<MainHomePage> createState() => _MainHomePageState(token2);
}

class _MainHomePageState extends State<MainHomePage> {
  String? token2;
_MainHomePageState(this.token2);

  void initState() {
    super.initState();
    getToken();
  }
    Future<Home2> getToken() async {
    var params = {
    "token": "$token2"
    };
    var response2 = await http.get(
        Uri.parse(
          'http://fca.systemiial.com/api/get-subjects-by-user?token=$token2',),);
    var client = http.Client();
    // print(response2.body);
    var data = jsonDecode(response2.body.toString());

      print("Homepage token recieved:   $token2");
      print("MainHomePage Response:     ${response2.body}");
    if (response2.statusCode == 200) {
      //  setState(() {
      //   Token3= data["access_token"];
      // });
      // print("This is my token:  $Token3");
      return Home2.fromJson(data);
    } else {
      return Home2.fromJson(data);
    }
  }


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        iconTheme: IconThemeData(color:Color(0xff0b5e54),),
          title: Padding(
            padding: const EdgeInsets.only(
              top: 30,
              right: 20),
            child: Image.asset(
              'images/elevatelogo.png',
              height: 230,
              width: 200,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          // actions: [
          //   Padding(
          //     padding: const EdgeInsets.only(right: 48),
          //     child: Icon(
          //       Icons.menu,
          //       size: 40,
          //       color: const Color(0xFF045a4f),
          //     ),
          //   ),
          // ],
        ),
              endDrawer: Padding(
        padding: const EdgeInsets.only(top: 70, bottom: 80),
        child: Drawer(
          backgroundColor:Color(0xff0b5e54),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), bottomLeft: Radius.circular(50)),
          ),
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              // const UserAccountsDrawerHeader( // <-- SEE HERE
              //   decoration: BoxDecoration(color: const Color(0xffffff)),
              //   accountName: Text(
              //     "hoome",
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              //   accountEmail: Text(
              //     "pin@gmail.com",
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              //   currentAccountPicture: FlutterLogo(),
              // ),
              Container(
                margin: EdgeInsets.only(right: 160),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                      width: 30.0,
                      height: 140.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("images/logocircle.png")))),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              button(
                  context, "VIEW PROFILE",  Color.fromARGB(255, 155, 156, 156)),
              button(context, "LOGOUT", Color.fromARGB(255, 155, 156, 156)),
              SizedBox(
                height: 150,
              ),
              Container(
                // width: 10,
                // height: 100,

                child: Image.asset(
                  "images/elevatelogo.png",
                  width: 10,
                ),
              )
            ],
          ),
        ),
      ),
        body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder<Home2>(
                  future: getToken(),
                  builder: (context, snapshot){
                    if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount:snapshot.data!.data!.length,                                        
                      itemBuilder: (context, index){
                        return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // ListTile(
                              //   title: Text(snapshot.data!.data![index].name!),
                              //   subtitle: Text(snapshot.data!.data![index].description!),
                              // ),
                              Container(
                                        height: 240,
                                        width: 380,
                                        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(80)),
                                        child: Card(
                                          shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                                          )
                          //set border radius more than 50% of height and width to make circle
                          ),
                                          color: Color(0xff0b5e54),
                                          margin: const EdgeInsets.all(20),
                                          child: Row(
                        children: [
                          Container(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 40),
                              child:RotatedBox(
                        quarterTurns: 3,
                        child:Center(
                          child: Text(snapshot.data!.data![index].name!,style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,fontWeight: FontWeight.bold),),
                        )
                        ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                )),
                            width: 60,
                            height: double.infinity,
                          ),
                          //                   Container(
                          //                     child:   VerticalDivider(
                          //                     width: 5,
                          //   color: Colors.white,
                          // thickness: 1,
                        
                          // ),
                          //                 )
                          // ,
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            'Play Deck',
                            style: TextStyle(color: Colors.white),
                          ),
                        
                          SizedBox(
                            width: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: VerticalDivider(
                              width: 5,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'View Sub Deck',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                                          ),
                                        )
                                        ),

                            ],
                          );
                        // Container(
                        //                 height: 240,
                        //                 width: 380,
                        //                 // decoration: BoxDecoration(borderRadius: BorderRadius.circular(80)),
                        //                 child: Card(
                        //                   shape: const RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.only(
                        // topLeft: Radius.circular(30),
                        // bottomLeft: Radius.circular(30),
                        // topRight: Radius.circular(30),
                        //                   )
                        //   //set border radius more than 50% of height and width to make circle
                        //   ),
                        //                   color: Color(0xff0b5e54),
                        //                   margin: const EdgeInsets.all(20),
                        //                   child: Row(
                        // children: [
                        //   Container(
                        //     child: Padding(
                        //       padding: EdgeInsets.symmetric(vertical: 40),
                        //       child:RotatedBox(
                        // quarterTurns: 3,
                        // child:Center(
                        //   child: Text("CHEMISTRY",style: TextStyle(
                        //     color: Colors.white,
                        //     fontSize: 20,fontWeight: FontWeight.bold),),
                        // )
                        // ),
                        //     ),
                        //     decoration: BoxDecoration(
                        //         color: Colors.black,
                        //         borderRadius: BorderRadius.only(
                        //           topLeft: Radius.circular(30),
                        //           bottomLeft: Radius.circular(30),
                        //         )),
                        //     width: 60,
                        //     height: double.infinity,
                        //   ),
                        //   //                   Container(
                        //   //                     child:   VerticalDivider(
                        //   //                     width: 5,
                        //   //   color: Colors.white,
                        //   // thickness: 1,
                        
                        //   // ),
                        //   //                 )
                        //   // ,
                        //   SizedBox(
                        //     width: 30,
                        //   ),
                        //   Text(
                        //     'Play Deck',
                        //     style: TextStyle(color: Colors.white),
                        //   ),
                        
                        //   SizedBox(
                        //     width: 30,
                        //   ),
                        //   Padding(
                        //     padding: const EdgeInsets.all(14.0),
                        //     child: VerticalDivider(
                        //       width: 5,
                        //       color: Colors.white,
                        //     ),
                        //   ),
                        //   SizedBox(
                        //     width: 20,
                        //   ),
                        //   Text(
                        //     'View Sub Deck',
                        //     style: TextStyle(color: Colors.white),
                        //   )
                        // ],
                        //                   ),
                        //                 )
                        //                 );
                      },
                    );}
                    else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  }),
              ),
            ],
          ),
        )
        
        
      ),
    );
  }
}

TextButton button(
  BuildContext context,
  String name,
  Color col,
) {
  return TextButton(
    onPressed: () {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const ShowAnswer()),
      // );
    },
    child: Container(
      alignment: Alignment.center,
      width: 350,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 50),
            child: Text(
              name,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(right: 30),
              child: Icon(Icons.arrow_forward, size: 25, color: Colors.white))
        ],
      ),
      decoration: BoxDecoration(
        color: col,
        borderRadius: BorderRadius.circular(25),
      ),
    ),
  );
}