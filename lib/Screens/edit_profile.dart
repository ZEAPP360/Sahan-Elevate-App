import 'dart:convert';
import 'package:email_validator/email_validator.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:learnerapp/Screens/user_subject.dart';
import 'package:learnerapp/Utilities/routes.dart';
import 'package:http/http.dart' as http;
import '../Services/editprofile_api.dart';
import 'profile_page.dart';

// ignore: must_be_immutable
class MyProfile extends StatefulWidget {
  String? editprofiletoken;

  MyProfile({this.editprofiletoken, super.key});

  @override
  // ignore: no_logic_in_create_state
  State<MyProfile> createState() => _MyProfileState(editprofiletoken);
}

class _MyProfileState extends State<MyProfile> {

  String? editprofiletoken;
  _MyProfileState(this.editprofiletoken);

  bool _isObscure = true;
  bool agree = false;
  bool Physics = false;
  bool Chemistry = false;
  bool Biology = false;
  bool Maths = false;
  bool isValidForm = false;

  final emailEdit= TextEditingController();
  final nameEdit= TextEditingController();
  final _formkey = GlobalKey<FormState>();

  // This function is triggered when the button is clicked
  void _doSomething() {
    // Do something
  }
   Future<EditProfile> getEdit(BuildContext context) async {
    // ignore: unused_local_variable
    var params = {'token':''};
    var response = await http.post(
      Uri.parse(
        "http://fca.systemiial.com/api/update-profile?token=$editprofiletoken"
      ),
      body:{
        'name':  nameEdit.text,
        'email': emailEdit.text,
      }   );
       
      var Client = http.Client();
      print(response.body);
      var data = jsonDecode(response.body.toString());
       
       if(response.statusCode == 200){
        return EditProfile.fromJson(data);
       }
 else {
      return EditProfile.fromJson(data);
    }
  }

  //  Future<Reset> getReset() async {
  //   var params = {"token": "$token5"};
  //   var response1 = await http.post(
  //       Uri.parse(
  //         'http://fca.systemiial.com/api/reset-password',
  //       ),
  //       body: {
  //         'password': pass2.text,
  //         'token': token5.toString(),
  //       });

  //   var client = http.Client();
  //   print(response1.body);
  //   var data = jsonDecode(response1.body.toString());

  //   print("Reset Password token recieved:   $token5");
  //   if (response1.statusCode == 200) {
  //     return Reset.fromJson(data);
  //   } else {
  //     return Reset.fromJson(data);
  //   }
  // }

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
        actions: const [
           Padding(
            padding: EdgeInsets.only(right: 48, top: 16),
            child: Icon(
              Icons.menu,
              size: 40,
              color: Color(0xFF045a4f),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                   const SizedBox(
                      width: 15,
                    ),
                    Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color(0xff0b5e54), width: 4))),
                        child: const Text(
                          "My Profile",
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                ),
                // Column(
                //   children: [
                //     SizedBox(width: 80,),
                //     AnimatedTextKit(
                //       animatedTexts: [
                //         TypewriterAnimatedText('Welcome Back',
                //             textStyle: const TextStyle(
                //               color: Colors.black,
                //               fontSize: 30,
                //               fontStyle: FontStyle.italic,
                //               fontFamily: 'Times New Roman',
                //               fontWeight: FontWeight.w500,
                //             ),
                //             speed: const Duration(
                //               milliseconds: 450,
                //             )),
                //       ],
                //       onTap: () {
                //         debugPrint("Welcome back!");
                //       },
                //       isRepeatingAnimation: true,
                //       totalRepeatCount: 2,
                //     ),
                //           AnimatedTextKit(
                //       animatedTexts: [
                //         TypewriterAnimatedText('login for Continue!',
                //             textStyle: const TextStyle(
                //               color: Colors.black,
                //               fontSize: 30,
                //               fontStyle: FontStyle.italic,
                //               fontFamily: 'Times New Roman',
                //               fontWeight: FontWeight.w500,
                //             ),
                //             speed: const Duration(
                //               milliseconds: 450,
                //             )),
                //       ],
                //       onTap: () {
                //         debugPrint("Welcome back!");
                //       },
                //       isRepeatingAnimation: true,
                //       totalRepeatCount: 2,
                //     ),
                //   ],
                // ),

                Container(
                  margin: const EdgeInsets.all(10),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                      const  SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01),
                            const Text(
                              'Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: nameEdit,
                          decoration: InputDecoration(
                              hintText: 'Enter Your Name',
                              labelText: 'Name',
                              // Set border for enabled state (default)
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3,
                                    color: Color.fromARGB(255, 188, 191, 188)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              // Set border for focused state
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3,
                                    color: Color.fromARGB(255, 188, 191, 188)),
                                borderRadius: BorderRadius.circular(15),
                              )),
                  
                              validator: (inputValue) {
                                if (inputValue!.isEmpty) {
                                  return "Enter Name";
                                }
                              }    
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01),
                            const Text('Your Email',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: emailEdit,
                          decoration: InputDecoration(
                              hintText: 'Your Email',
                              labelText: 'youremail@gmail.com',
                              // Set border for enabled state (default)
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3,
                                    color: Color.fromARGB(255, 188, 191, 188)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              // Set border for focused state
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3,
                                    color: Color.fromARGB(255, 188, 191, 188)),
                                borderRadius: BorderRadius.circular(15),
                              )),
                              validator: (inputValue) {
                                if (inputValue!.isEmpty) {
                                  return "Enter Email";
                                }
                              }  
                        ),
                  
                        // const SizedBox(
                        //   height: 15,
                        // ),
                        // TextField(
                        //   obscureText: _isObscure,
                        //   decoration: InputDecoration(
                        //       suffixIcon: IconButton(
                        //           icon: Icon(
                        //               _isObscure
                        //                   ? Icons.visibility
                        //                   : Icons.visibility_off,
                        //               color: const Color.fromARGB(255, 3, 52, 4)),
                        //           onPressed: () {
                        //             setState(() {
                        //               _isObscure = !_isObscure;
                        //             });
                        //           }),
                        //       hintText: 'Enter Your Password',
                        //       labelText: 'Password',
                        //       // Set border for enabled state (default)
                        //       enabledBorder: OutlineInputBorder(
                        //         borderSide: const BorderSide(
                        //             width: 3,
                        //             color: Color.fromARGB(255, 188, 191, 188)),
                        //         borderRadius: BorderRadius.circular(15),
                        //       ),
                        //       // Set border for focused state
                        //       focusedBorder: OutlineInputBorder(
                        //         borderSide: const BorderSide(
                        //             width: 3,
                        //             color: Color.fromARGB(255, 188, 191, 188)),
                        //         borderRadius: BorderRadius.circular(15),
                        //       )),
                        // ),
                  
                        const SizedBox(
                          height: 50,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Select Your subjects',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 50,
                                ),
                                Row(
                                  children: [
                                    Material(
                                      child: Checkbox(
                                        activeColor: const Color(0xFF045a4f),
                                        value: Chemistry,
                                        onChanged: (value) {
                                          setState(() {
                                            Chemistry = value ?? false;
                                          });
                                        },
                                      ),
                                    ),
                                    const Text(
                                      'Chemistry',
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 40,
                                ),
                                Row(
                                  children: [
                                    Material(
                                      child: Checkbox(
                                        activeColor: const Color(0xFF045a4f),
                                        value: Physics,
                                        onChanged: (value) {
                                          setState(() {
                                            Physics = value ?? false;
                                          });
                                        },
                                      ),
                                    ),
                                    const Text(
                                      'Physics',
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 50,
                                ),
                                Row(
                                  children: [
                                    Material(
                                      child: Checkbox(
                                        activeColor: const Color(0xFF045a4f),
                                        value: Maths,
                                        onChanged: (value) {
                                          setState(() {
                                            Maths = value ?? false;
                                          });
                                        },
                                      ),
                                    ),
                                    const Text(
                                      'Maths',
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 65,
                                ),
                                Row(
                                  children: [
                                    Material(
                                      child: Checkbox(
                                        activeColor: const Color(0xFF045a4f),
                                        value: Biology,
                                        onChanged: (value) {
                                          setState(() {
                                            Biology = value ?? false;
                                          });
                                        },
                                      ),
                                    ),
                                    const Text(
                                      'Biology',
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Row(
                        //   children: [
                        //     Material(
                        //       child: Checkbox(
                        //         activeColor: Colors.green,
                        //         value: agree,
                        //         onChanged: (value) {
                        //           setState(() {
                        //             agree = value ?? false;
                        //           });
                        //         },
                        //       ),
                        //     ),
                        //     const Text(
                        //       'I have read and accept terms and conditions',
                        //       style: TextStyle(
                        //           fontWeight: FontWeight.bold, fontSize: 15),
                        //       overflow: TextOverflow.ellipsis,
                        //     )
                        //   ],
                        // ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          // onPressed: (() {
                          //   getEdit();
                          //         Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (context) => Profile2(token4: editprofiletoken)),
                          //         );
                          //         const snackBar = SnackBar(
                          //             content: Text("User Profile Updated!"));
                          //         ScaffoldMessenger.of(context)
                          //             .showSnackBar(snackBar);
                          // }),
                          onPressed: () {
                                    if (_formkey.currentState!.validate()) {
                                      setState(() {
                                        isValidForm = true;
                                      });
                                      getEdit(context);
                                       Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainHomePage2(token2: editprofiletoken)),
                                );
                                const snackBar = SnackBar(
                                    content: Text("Profile Updated!"));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                    } else {
                                      setState(() {
                                        isValidForm = false;
                                      });
                                      // getEdit(context);
                                    }
                                  },
                          child: Container(
                            alignment: Alignment.center,
                            width: 400,
                            height: 50,
                            child: const Text(
                              'SAVE',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF045a4f),
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                        // Row(
                        //   children: [
                        //     const Text('Don\'t have an account?'),
                        //     TextButton(
                        //       onPressed: (() {
                        //         Navigator.pushNamed(
                        //           context,
                        //           MyRoutes.otpVerification,
                        //         );
                        //       }),
                        //       child: const Text(
                        //         'Sign Up here',
                        //         style: TextStyle(
                        //           color: Color.fromARGB(255, 12, 114, 14),
                        //           fontSize: 15,
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
