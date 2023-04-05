import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:learnerapp/Utilities/routes.dart';
import 'package:learnerapp/Utilities/routes.dart';
import 'package:http/http.dart' as http;

import '../Services/signup_api.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUp> {
  bool _isObscure = true;
  bool agree = false;
  bool Physics = false;
  bool Chemistry = false;
  bool Biology = false;
  bool Maths = false;
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  // final name = TextEditingController();
  // This function is triggered when the button is clicked
  void _doSomething() {
    // Do something
  }
  voidinitState() {
    getStatus();
  }

  Future<Register> getStatus() async {
    var response1 = await http.post(
        Uri.parse(
          'http://fca.systemiial.com/api/register',
        ),
        body: {
          'name': name.text,
          'email': email.text,
          'password': password.text,
          'password_confirmation': password.text,
          'pref_ids': '1'
        });

    var client = http.Client();
    print(response1.body);
    var data = jsonDecode(response1.body.toString());
    if (response1.statusCode == 200) {
      return Register.fromJson(data);
    } else {
      return Register.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: MaterialButton(
            minWidth: 2,
            shape: const CircleBorder(),
            color: Color(0xFF045a4f),
            padding: const EdgeInsets.all(5),
            onPressed: () {
              Navigator.pushNamed(
                context,
                MyRoutes.waiting,
              );
            },
            child: Center(
              child: Icon(
                Icons.arrow_back,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),

        title: Padding(
          padding: const EdgeInsets.only(top: 30, right: 20),
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                SizedBox(
                  height: 50,
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
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
                      TextField(
                        controller: name,
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
                      TextField(
                        controller: email,
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
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01),
                          const Text(
                            'Password',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: password,
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(
                                    _isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: const Color.fromARGB(255, 3, 52, 4)),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                            hintText: 'Enter Your Password',
                            labelText: 'Password',
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
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: const Text(
                            '(Enter a 8 or more characters long password)'),
                      ),
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

                      Row(
                        children: [
                          Material(
                            child: Checkbox(
                              activeColor:  const Color(0xFF045a4f),
                              value: agree,
                              onChanged: (value) {
                                setState(() {
                                  agree = value ?? false;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Text(
                              'I HAVE READ, UNDERSTOOD, AND ACCEPTED\n THE PRIVACY POLICY',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15),
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        onPressed: (() {
                          getStatus();
                        }),
                        child: Container(
                          alignment: Alignment.center,
                          width: 400,
                          height: 50,
                          child: const Text(
                            'SIGN UP',
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
                      Row(
                        children: [
                          const Text('You have an account?'),
                          TextButton(
                            onPressed: (() {
                              Navigator.pushNamed(
                                context,
                                MyRoutes.loginScreen,
                              );
                            }),
                            child: const Text(
                              'SIGNIN',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ],
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