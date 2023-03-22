import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:learnerapp/Utilities/routes.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<MyProfile> {
  bool _isObscure = true;
  bool agree = false;
  bool Physics = false;
  bool Chemistry = false;
  bool Biology = false;
  bool Maths = false;

  // This function is triggered when the button is clicked
  void _doSomething() {
    // Do something
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
     
                
          title: Padding(
            padding: const EdgeInsets.only(
              top: 20,
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
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 48,top: 16),
              child: Icon(
                Icons.menu,
                size: 40,
                color: const Color(0xFF045a4f),
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

                SizedBox(height: 20,),
              Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
             SizedBox(width: 15,),
             Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xff0b5e54),
              width: 4

            )
          )
        ),
          child: Text(
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
                  child: Column(

                    children: [
                    SizedBox(height: 40,),
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
                                      activeColor: Colors.green,
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
                                      activeColor: Colors.green,
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
                                      activeColor: Colors.green,
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
                                      activeColor: Colors.green,
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
                        onPressed: (() {
                          Navigator.pushNamed(context, MyRoutes.profile2);
                        }),
                        child: Container(
                          alignment: Alignment.center,
                          width: 400,
                          height: 50,
                          child: const Text(
                            'Save',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
