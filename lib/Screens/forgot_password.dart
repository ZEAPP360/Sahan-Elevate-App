import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:learnerapp/Utilities/routes.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<ForgotPassword> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
 appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: MaterialButton(
                        minWidth: 2,
                        shape: const CircleBorder(),
            color:Color(0xFF045a4f),
                        padding: const EdgeInsets.all(5),
                        onPressed: () {

                            Navigator.pushNamed(
                                context,
                                MyRoutes.loginScreen,
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
             
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28.26,
                    // fontStyle: FontStyle.italic,
                    // fontFamily: 'Times New Roman',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Text(
                    'Enter your email address to reset the  ',
                    style: TextStyle(color: Color(0xffA5AABB), fontSize: 20),
                  ),
                ),
                Container(
                  child: Text(
                    'password',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 32,
                  ),
                  child: Column(
                    children: [
                      // Note: Same code is applied for the TextFormField as well
                      TextField(
                        decoration: InputDecoration(
                            hintText: 'Enter Your Email',
                            labelText: 'Email',
                            // Set border for enabled state (default)
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 3,
                                color: Color(0xFFDFE9E8),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            // Set border for focused state
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 3,
                                color: Color(0xFFDFE9E8),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            )),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      TextButton(
                        onPressed: (() {
                          Navigator.pushNamed(context, MyRoutes.waiting);
                        }),
                        child: Container(
                          alignment: Alignment.center,
                          width: 400,
                          height: 50,
                          child: Text(
                            'Send',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFF045a4f),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Text('Don\'t recieve the Code ?'),
                          TextButton(
                            onPressed: (() {
                              Navigator.pushNamed(
                                context,
                                MyRoutes.resetpassword,
                              );
                            }),
                            child: const Text(
                              'Resend Code',
                              style: TextStyle(
                                color: Color(0xFF045a4f),
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
