import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:learnerapp/Screens/resetpassword.dart';
import 'package:learnerapp/Services/view_profile.dart';
import 'package:http/http.dart' as http;

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
    // print(token3);
    getProfile();
  }

  String Name = "";
  String Email = "";
  List Subjects = [];
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
          title: Padding(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: Image.asset(
              'images/elevatelogo.png',
              height: 230,
              width: 200,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 48, top: 16),
              child: Icon(
                Icons.menu,
                size: 40,
                color: const Color(0xFF045a4f),
              ),
            ),
          ],
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
                                    'SELECT SUUBJECT',
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
                  button(context, "EDIT PROFILE", Color(0xff0b5e54)),
                  button(context, "CHANGE PASSWORD", Color(0xff0b5e54)),
                  button(context, "DELETE ACCOUNT", Colors.pink),
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