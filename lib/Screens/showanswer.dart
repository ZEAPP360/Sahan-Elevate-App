import 'package:flutter/material.dart';
import 'package:learnerapp/Utilities/routes.dart';

class MyAnswers extends StatefulWidget {
  const MyAnswers({super.key});

  @override
  State<MyAnswers> createState() => _MyAnswersState();
}

class _MyAnswersState extends State<MyAnswers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Column(
      //logo row
       
        children: [
 
          Row(
            children: [
            
              const SizedBox(
                width: 70,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: const Image(
                  height: 200,
                  image: AssetImage('images/elevatelogo.png'),
                ),
              ),
               Container(
          
                width: 100.0,
                child: const Icon(
                  Icons.menu,
                  size: 37,
                  color: Color(0xff022924),
                ),
              ),
            ],
          ),
    
        //boxes
      
          Expanded(
            child: Stack(
              children: [
                Positioned(
                    
                    left: 30,
                    width: 320,
                    height: 500,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff022924),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(60.0),
                            bottomRight: Radius.circular(60.0),
                            topLeft: Radius.circular(60.0),
                          )),
                    )),
                Positioned(
                    top: 15,
                    left: 40,
                    width: 320,
                    height: 500,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff07433b),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(60.0),
                            bottomRight: Radius.circular(60.0),
                            topLeft: Radius.circular(60.0),
                          )),
                    )),
                Positioned(
                    top: 25,
                    left: 60,
                    width: 320,
                    height: 500,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff045a4f),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(60.0),
                            bottomRight: Radius.circular(60.0),
                            topLeft: Radius.circular(60.0),
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text(
                                      "ANSWER",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Center(
                                child: Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, ",
                                  style:
                                      TextStyle(color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  height: 40,
                                  width: 270,
                                  decoration: BoxDecoration(
                                      color: Color(0xff6bdc58),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.fmd_good,
                                          color: Colors.yellow,
                                        ),
                                      ),
                                      Text(
                                        'PERFACT                               1 min',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              height: 40,
                              width: 270,
                              decoration: BoxDecoration(
                                  color: Color(0xfffd6d6d),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.fmd_good,
                                      color: Colors.yellow,
                                    ),
                                  ),
                                  Text(
                                    'POOR                                     1 min',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              height: 40,
                              width: 270,
                              decoration: BoxDecoration(
                                  color: Color(0xfffac663),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.fmd_good,
                                      color: Colors.yellow,
                                    ),
                                  ),
                                  Text(
                                    'GOOD                                    1 min',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              height: 40,
                              width: 270,
                              decoration: BoxDecoration(
                                  color: Color(0xff2ce4e2),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.fmd_good,
                                      color: Colors.yellow,
                                    ),
                                  ),
                                  Text(
                                    'REPEAT                                1 min',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
          
                    
              ],
            ),
          ),

          //button
          TextButton(
                onPressed: (() {

           Navigator.pushNamed(
                        context,
                        MyRoutes.question,
                      );

                }),
                child: Container(
                  alignment: Alignment.center,
                  width: 350,
                  height: 50,
                  child: const Text(
                    'Show Answer',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),

              ),
        ],
      ),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class Annwer extends StatelessWidget {
//   const Annwer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: Stack(
//               children: [
//                  Positioned(
//    top: 100,
//     left: 40,
//    width : 280,
// height: 280,
//    child: Container(
//     color: Colors.red,

// )

// ),

//                 // Positioned(
//                 //   top: 100,
//                 //   left: 40,
//                 //   height: 280,
//                 //   width: 280,
//                 //   child: Container(
  //                   decoration: BoxDecoration(
  //                       color: Color(0xff012a24),
  //                       borderRadius: BorderRadius.only(
  //                         topRight: Radius.circular(60.0),
  //                         bottomRight: Radius.circular(60.0),
  //                         topLeft: Radius.circular(60.0),
  //                       )),
  // ),
//                 // ),
//                 // Positioned(
//                 //   top: 100,
//                 //   left: 40,
//                 //   height: 280,
//                 //   width: 280,
//                 //   child: Container(
//                 //     decoration: BoxDecoration(
//                 //         color: Color(0xff012a24),
//                 //         borderRadius: BorderRadius.only(
//                 //           topRight: Radius.circular(60.0),
//                 //           bottomRight: Radius.circular(60.0),
//                 //           topLeft: Radius.circular(60.0),
//                 //         )),
//                 //   ),
//                 // ),
//                 // Positioned(
//                 //   top: 50,
//                 //   right: 0,
//                 //   child: Container(
//                 //     height: 510,
//                 //     width: 330,
//                 //     decoration: BoxDecoration(
//                 //         color: Color.fromARGB(255, 163, 204, 199),
//                 //         borderRadius: BorderRadius.only(
//                 //           topRight: Radius.circular(60.0),
//                 //           bottomRight: Radius.circular(60.0),
//                 //           topLeft: Radius.circular(60.0),
//                 //         )),
//                 //   ),
//                 // ),
//                 //   Positioned(
//                 // top: 200,
//                 //   right: 0,
//                 //   child: Container(
//                 //     height: 510,
//                 //     width: 330,
//                 //     decoration: BoxDecoration(
//                 //         color: Color.fromARGB(255, 87, 159, 149),
//                 //         borderRadius: BorderRadius.only(
//                 //           topRight: Radius.circular(60.0),
//                 //           bottomRight: Radius.circular(60.0),
//                 //           topLeft: Radius.circular(60.0),
//                 //         )),
//                 //   ),
//                 // ),
//                 // Positioned(
//                 // top: 80,
//                 //   right: 0,
//                 //   child: Stack(
//                 //     children: [
//                 //       Container(
//                 //         height: 490,
//                 //         width: 310,
//                 //         decoration: BoxDecoration(
//                 //             color: Color(0xff045a4f),
//                 //             borderRadius: BorderRadius.only(
//                 //               topRight: Radius.circular(60.0),
//                 //               bottomRight: Radius.circular(60.0),
//                 //               topLeft: Radius.circular(60.0),
//                 //             )),
//                 //       ),
//                 //       Column(
//                 //         mainAxisAlignment: MainAxisAlignment.center,
//                 //         crossAxisAlignment: CrossAxisAlignment.center,
//                 //         children: [
//                 //           Row(
//                 //             mainAxisAlignment: MainAxisAlignment.center,
//                 //             crossAxisAlignment: CrossAxisAlignment.center,
//                 //             children: [
//                 //               Center(
//                 //                 child: Container(
//                 //                     margin: EdgeInsets.all(60),
//                 //                     child: Text(
//                 //                       "ANSWER",
//                 //                       style: TextStyle(
//                 //                           fontSize: 22,
//                 //                           fontWeight: FontWeight.bold,
//                 //                           color: Colors.white),
//                 //                     )),
//                 //               )
//                 //             ],
//                 //           ),
//                 //           SizedBox(
//                 //             height: 20,
//                 //           ),
//                 //           Row(
//                 //             children: [
//                 //               Text(
//                 //                 "It is a long established  fact that\n a reader will be distracted  by \n the readable content of  a page",
//                 //                 style: TextStyle(
//                 //                     color: Colors.white, fontSize: 15),
//                 //               )
//                 //             ],
//                 //           ),
//                 //           SizedBox(
//                 //             height: 50,
//                 //           ),
//                 //           Row(
//                 //             mainAxisAlignment: MainAxisAlignment.center,
//                 //             crossAxisAlignment: CrossAxisAlignment.center,
//                 //             children: [
//                 //               Center(
//                 //                 child: Container(
//                 //                   margin: EdgeInsets.only(left: 20),
//                 //                   height: 40,
//                 //                   width: 270,
//                 //                   decoration: BoxDecoration(
//                 //                       color: Colors.pink,
//                 //                       borderRadius: BorderRadius.circular(20)),
//                 //                   child: Row(
//                 //                     children: [
//                 //                       Padding(
//                 //                         padding: const EdgeInsets.all(8.0),
//                 //                         child: Icon(
//                 //                           Icons.fmd_good,
//                 //                           color: Colors.yellow,
//                 //                         ),
//                 //                       ),
//                 //                       Text(
//                 //                         'PERFACT                           1 min',
//                 //                         style: TextStyle(
//                 //                             fontSize: 15,
//                 //                             fontWeight: FontWeight.bold,
//                 //                             color: Colors.white),
//                 //                       )
//                 //                     ],
//                 //                   ),
//                 //                 ),
//                 //               )
//                 //             ],
//                 //           ),
//                 //           SizedBox(
//                 //             height: 6,
//                 //           ),
//                 //           Center(
//                 //             child: Container(
//                 //               margin: EdgeInsets.only(left: 20),
//                 //               height: 40,
//                 //               width: 270,
//                 //               decoration: BoxDecoration(
//                 //                   color: Colors.green,
//                 //                   borderRadius: BorderRadius.circular(20)),
//                 //               child: Row(
//                 //                 children: [
//                 //                   Padding(
//                 //                     padding: const EdgeInsets.all(8.0),
//                 //                     child: Icon(
//                 //                       Icons.fmd_good,
//                 //                       color: Colors.yellow,
//                 //                     ),
//                 //                   ),
//                 //                   Text(
//                 //                     'POOR                             1 min',
//                 //                     style: TextStyle(
//                 //                         fontSize: 15,
//                 //                         fontWeight: FontWeight.bold,
//                 //                         color: Colors.white),
//                 //                   )
//                 //                 ],
//                 //               ),
//                 //             ),
//                 //           ),
//                 //           SizedBox(
//                 //             height: 6,
//                 //           ),
//                 //           Center(
//                 //             child: Container(
//                 //               margin: EdgeInsets.only(left: 20),
//                 //               height: 40,
//                 //               width: 270,
//                 //               decoration: BoxDecoration(
//                 //                   color: Colors.orange,
//                 //                   borderRadius: BorderRadius.circular(20)),
//                 //               child: Row(
//                 //                 children: [
//                 //                   Padding(
//                 //                     padding: const EdgeInsets.all(8.0),
//                 //                     child: Icon(
//                 //                       Icons.fmd_good,
//                 //                       color: Colors.yellow,
//                 //                     ),
//                 //                   ),
//                 //                   Text(
//                 //                     'GOOD                             1 min',
//                 //                     style: TextStyle(
//                 //                         fontSize: 15,
//                 //                         fontWeight: FontWeight.bold,
//                 //                         color: Colors.white),
//                 //                   )
//                 //                 ],
//                 //               ),
//                 //             ),
//                 //           ),
//                 //           SizedBox(
//                 //             height: 6,
//                 //           ),
//                 //           Center(
//                 //             child: Container(
//                 //               margin: EdgeInsets.only(left: 20),
//                 //               height: 40,
//                 //               width: 270,
//                 //               decoration: BoxDecoration(
//                 //                   color: Colors.lightBlue,
//                 //                   borderRadius: BorderRadius.circular(20)),
//                 //               child: Row(
//                 //                 children: [
//                 //                   Padding(
//                 //                     padding: const EdgeInsets.all(8.0),
//                 //                     child: Icon(
//                 //                       Icons.fmd_good,
//                 //                       color: Colors.yellow,
//                 //                     ),
//                 //                   ),
//                 //                   Text(
//                 //                     'REPEAT                             1 min',
//                 //                     style: TextStyle(
//                 //                         fontSize: 15,
//                 //                         fontWeight: FontWeight.bold,
//                 //                         color: Colors.white),
//                 //                   )
//                 //                 ],
//                 //               ),
//                 //             ),
//                 //           ),
//                 //         ],
//                 //       ),
//                 //     ],
//                 //   ),
//                 // )
//               ],
//             ),
//           ),
    
//         ],
//       ),
//     );
//   }
// }