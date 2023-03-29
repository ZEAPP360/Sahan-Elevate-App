import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:learnerapp/Screens/reset_password.dart';
import 'package:learnerapp/Services/view_profile.dart';
import 'package:http/http.dart' as http;

import 'login_screen.dart';
import 'edit_profile.dart';

class Profile2 extends StatefulWidget {
  String? token4;

  Profile2({this.token4, super.key});


  @override
  State<Profile2> createState() => _Profile2State(token4);
}

class _Profile2State extends State<Profile2> {
  String? token4;
  _Profile2State(this.token4);

  // ignore: annotate_overrides
  void initState() {
    super.initState();
    getProfile();
  }

  String Name = "";
  String Email = "";
  List Subjects = [];
  final _formkey = GlobalKey<FormState>();
  
  getProfile() async {
    // ignore: unused_local_variable
    var params = {"token": "$token4"};
    var response2 = await http.get(
      Uri.parse(
        'http://fca.systemiial.com/api/view-profile?token=$token4',
      ),
    );
    var client = http.Client();
    // print(response2.body);
    var data = jsonDecode(response2.body.toString());

    print("profile page token recieved:   $token4");
    print("profile page Response:     ${data["data"]["subjects"].length}");
    if (response2.statusCode == 200) {
      Name = data["data"]["name"];
      Email = data["data"]["email"];
      // var sub = data["data"]
      Subjects = [];

      for (var i = 0; i < data["data"]["subjects"].length; i++) {
        print(data["data"]["subjects"][i]);
        Subjects.add(data["data"]["subjects"][i]);
      }

      setState(() {});
      // var dataget = data[0][]
      //  setState(() {
      //   Token3= data["access_token"];
      // });
      // print("This is my token:  $Token3");
      // return MyProfileView.fromJson(data);
    } else {
      // return MyProfileView.fromJson(data);
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            iconTheme: const IconThemeData(
              color: Color(0xff0b5e54),
            ),
            leading: const BackButton(
    color: Colors.black, // <-- SEE HERE
  ),
            title: Padding(
              padding: const EdgeInsets.only(top: 30, right: 20),
              child: Image.asset(
                'images/elevatelogo.png',
                height: 230,
                width: 200,
              ),
            ),
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
              backgroundColor: const Color(0xff0b5e54),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50)),
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
                    margin: const EdgeInsets.only(right: 160),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                          width: 30.0,
                          height: 140.0,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage("images/logocircle.png")))),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Profile2(token4: token4)),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 350,
                      height: 40,
                      // ignore: sort_child_properties_last
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 50),
                            child: Text(
                              "View Profile",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(right: 30),
                              child: const Icon(Icons.arrow_forward,
                                  size: 25, color: Colors.white))
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 155, 156, 156),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                                title: const Text("Log out"),
                                content: const Text("Are you sure to logout?"),
                                actions: [
                                  TextButton(
                                      onPressed: () async {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen(),
                                          ),
                                        );
                                      },
                                      child: const Text("Yes")),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("No"))
                                ],
                              ));
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const LoginScreen()),
                      // );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 350,
                      height: 40,
                      // ignore: sort_child_properties_last
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 50),
                            child: const Text(
                              "Log out",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(right: 30),
                              child: const Icon(Icons.arrow_forward,
                                  size: 25, color: Colors.white))
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 155, 156, 156),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  // ignore: avoid_unnecessary_containers
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
        body: Column(children: [
          // Expanded(
          //   child: FutureBuilder<MyProfileView>(
          //     future: getProfile(),
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         return ListView.builder(
          //             itemCount: snapshot.data,
          //             itemBuilder: (context, index) {
          //               return Column(
          //                 mainAxisAlignment: MainAxisAlignment.start,
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   ListTile(
          //                     title:
          //                         Text(snapshot.data!.data!.name.toString()),
          //                     subtitle:
          //                         Text(snapshot.data!.data!.email.toString()),
          //                   ),

          //                   // Icon(snapshot.data!.data![index].inWishlist! == false ? Icons.favorite : Icons.favorite_outline)
          //                 ],
          //               );
          //             });
          //       } else {
          //         return Text('Loading');
          //       }
          //     },
          //   ),
          // ),
          //     Column(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         ListTile(
          //           title: Text(Name.toString()),
          //           subtitle: Text(Email.toString()),
          //         ),

          //         // Icon(snapshot.data!.data![index].inWishlist! == false ? Icons.favorite : Icons.favorite_outline)
          //       ],
          //     ),
          //     Text("data")
          //   ],
          // )

          //bla bla

        Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color(0xff0b5e54), width: 4))),
                          child: Text(
                            "My Profile",
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 270,
                    width: 380,
                    // decoration: BoxDecoration(borderRadius: BorderRadius.circular(80)),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        //set border radius more than 50% of height and width to make circle
                      ),
                      color: Color(0xff0b5e54),
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 150,
                                width: 150,
                                child: Image.asset('images/logocircle.png'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'YOUR NAME',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    Name.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'EMAIL ADDRESS',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    Email.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'SELECT SUBJECT',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                  // Row(
                                  //   crossAxisAlignment:
                                  //       CrossAxisAlignment.start,
                                  //   mainAxisAlignment: MainAxisAlignment.start,
                                  //   children: [
                                  //     TextButton(
                                  //       onPressed: () {
                                  //         // Navigator.push(
                                  //         //   context,
                                  //         //   MaterialPageRoute(
                                  //         //       builder: (context) =>
                                  //         //           const ShowAnswer()),
                                  //         // );
                                  //       },
                                  //       child: Container(
                                  //         alignment: Alignment.center,
                                  //         width: 80,
                                  //         height: 20,
                                  //         child: Text(
                                  //           // Subjects.toString(),
                                  //              Subjects[0]["name"],
                                  //           style: TextStyle(
                                  //             fontSize: 12,
                                  //             color: Colors.white,
                                  //           ),
                                  //         ),
                                  //         decoration: BoxDecoration(
                                  //           color: Color.fromARGB(
                                  //               255, 167, 166, 166),
                                  //           borderRadius:
                                  //               BorderRadius.circular(25),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //     Subjects.length != 0
                                  //         ? TextButton(
                                  //             onPressed: () {
                                  //               // Navigator.push(
                                  //               //   context,
                                  //               //   MaterialPageRoute(
                                  //               //       builder: (context) =>
                                  //               //           const ShowAnswer()),
                                  //               // );
                                  //             },
                                  //             child: Container(
                                  //               alignment: Alignment.center,
                                  //               width: 80,
                                  //               height: 20,
                                  //               child: Text(
                                  //                 Subjects[1]["name"]
                                  //                     .toString(),
                                  //                 style: TextStyle(
                                  //                   fontSize: 12,
                                  //                   color: Colors.white,
                                  //                 ),
                                  //               ),
                                  //               decoration: BoxDecoration(
                                  //                 color: Color.fromARGB(
                                  //                     255, 167, 166, 166),
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(25),
                                  //               ),
                                  //             ),
                                              
                                  //           )
                                  //         : CircularProgressIndicator()
                                          
                                  //   ],
                                  // ),
                                  
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////
                  TextButton(
     onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyProfile(editprofiletoken:token4)),
        );
      },
      child: Container(
        alignment: Alignment.center,
        width: 350,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xff0b5e54),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 50),
              child: Text(
                "EDIT PROFILE",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 30),
                child: Icon(Icons.arrow_forward, size: 25, color: Colors.grey))
          ],
        ),
      ),
    ),
/////////////////////////////////////////////////////////////////////////////////////
                  button(context, "CHANGE PASSWORD", Color(0xff0b5e54)),
////////////////////////////////////////////////////////////////////////////////////
                //  button(context, "DELETE ACCOUNT", Colors.pink),

      TextButton(
     onPressed: () {
                      showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                                title: const Text("Log out"),
                                content: const Text("Are you sure to logout?"),
                                actions: [
                                  TextButton(
                                      onPressed: () async {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen(),
                                          ),
                                        );
                                      },
                                      child: const Text("Yes")),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("No"))
                                ],
                              ));
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const LoginScreen()),
                      // );
                    },
      child: Container(
        alignment: Alignment.center,
        width: 350,
        height: 50,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 156, 5, 60),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 50),
              child: Text(
                "LOGOUT",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 30),
                child: Icon(Icons.arrow_forward, size: 25, color: Colors.grey))
          ],
        ),
      ),
    ),

                 
                ],
              )
        ]));
  }

  TextButton button(
    BuildContext context,
    String name,
    Color col,
  ) {
    return TextButton(
     onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ResetPassword(token5: token4)),
        );
      },
      child: Container(
        alignment: Alignment.center,
        width: 350,
        height: 50,
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
                child: Icon(Icons.arrow_forward, size: 25, color: Colors.grey))
          ],
        ),
        decoration: BoxDecoration(
          color: col,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}


/////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////

// import 'package:flutter/material.dart';
// import 'package:learnerapp/Screens/resetpassword.dart';

// // ignore: must_be_immutable
// class Profile2 extends StatefulWidget {
//     String? token4;

//   Profile2({super.key, this.token4});

//   @override
//   // ignore: no_logic_in_create_state
//   State<Profile2> createState() => _Profile2State(token4);
// }

// class _Profile2State extends State<Profile2> {
//   String? token4;
//  _Profile2State(this.token4);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//      appBar: AppBar(
     
                
//           title: Padding(
//             padding: const EdgeInsets.only(
//               top: 20,
//               right: 20),
//             child: Image.asset(
//               'images/elevatelogo.png',
//               height: 230,
//               width: 200,
//             ),
//           ),
//           centerTitle: true,
//           elevation: 0,
//           backgroundColor: Colors.white,
//           actions: [
//             Padding(
//               padding: const EdgeInsets.only(right: 48,top: 16),
//               child: Icon(
//                 Icons.menu,
//                 size: 40,
//                 color: const Color(0xFF045a4f),
//               ),
//             ),
//           ],
//         ), 
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//              SizedBox(height: 50,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//              SizedBox(width: 30,),
//              Container(
//         decoration: BoxDecoration(
//           border: Border(
//             bottom: BorderSide(
//               color: Color(0xff0b5e54),
//               width: 4

//             )
//           )
//         ),
//           child: Text(
//         "My Profile",
//         style: TextStyle(
//             fontSize: 21,
//             fontWeight: FontWeight.bold,
//             ),
//       ))
//               ],
//             ),
//             SizedBox(height: 15,),
//             Container(
//               height: 270,
//               width: 380,
//               // decoration: BoxDecoration(borderRadius: BorderRadius.circular(80)),
//               child: Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(40),
//                   //set border radius more than 50% of height and width to make circle
//                 ),
//                 color: Color(0xff0b5e54),
//                 margin: const EdgeInsets.all(10),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                           alignment: Alignment.centerLeft,
//                           height: 150,
//                           width: 150,
//                           child: Image.asset('images/logocircle.png'),
//                         ),
//                         SizedBox(width: 10,),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Text(
//                               'YOUR NAME',
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 12),
//                             ),
//                             SizedBox(
//                               height: 4,
//                             ),
//                             Text(
//                               'JHON SMITH',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(
//                               height: 4,
//                             ),
//                             Text(
//                               'EMAIL ADDRESS',
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 12),
//                             ),
//                             SizedBox(
//                               height: 4,
//                             ),
//                             Text(
//                               'johansmith@gmail.com',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(
//                               height: 8,
//                             ),
//                             Text(
//                               'SELECT SUUBJECT',
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 12),
//                             ),
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 TextButton(
//                                   onPressed: () {
//                                     // Navigator.push(
//                                     //   context,
//                                     //   MaterialPageRoute(
//                                     //       builder: (context) =>
//                                     //           const ShowAnswer()),
//                                     // );
//                                   },
//                                   child: Container(
//                                     alignment: Alignment.center,
//                                     width: 80,
//                                     height: 20,
//                                     child: const Text(
//                                       'Chemistry',
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                     decoration: BoxDecoration(
//                                       color: Color.fromARGB(255, 167, 166, 166),
//                                       borderRadius: BorderRadius.circular(25),
//                                     ),
//                                   ),
//                                 ),
//                                 TextButton(
//                                   onPressed: () {
//                                     // Navigator.push(
//                                     //   context,
//                                     //   MaterialPageRoute(
//                                     //       builder: (context) =>
//                                     //           const ShowAnswer()),
//                                     // );
//                                   },
//                                   child: Container(
//                                     alignment: Alignment.center,
//                                     width: 80,
//                                     height: 20,
//                                     child: const Text(
//                                       'Chemistry',
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                     decoration: BoxDecoration(
//                                       color: Color.fromARGB(255, 167, 166, 166),
//                                       borderRadius: BorderRadius.circular(25),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             button(context, "EDIT PROFILE", Color(0xff0b5e54)),
//             button(context, "CHANGE PASSWORD", Color(0xff0b5e54)),
//             button(context, "DELETE ACCOUNT", Colors.pink),
//           ],
//         ),
//       ),
//     );
//   }

//   TextButton button(
//     BuildContext context,
//     String name,
//     Color col,
//   ) {
//     return TextButton(
//       onPressed: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => ResetPassword(token5: token4)),
//         );
//       },
//       child: Container(
//         alignment: Alignment.center,
//         width: 350,
//         height: 50,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               margin: EdgeInsets.only(left: 50),
//               child: Text(
//                 name,
//                 style: TextStyle(
//                   fontSize: 15,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             Container(
//                 margin: EdgeInsets.only(right: 30),
//                 child: Icon(Icons.arrow_forward, size: 25, color: Colors.grey))
//           ],
//         ),
//         decoration: BoxDecoration(
//           color: col,
//           borderRadius: BorderRadius.circular(25),
//         ),
//       ),
//     );
//   }
// }