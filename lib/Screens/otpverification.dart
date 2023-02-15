import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:learnerapp/Utilities/routes.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({Key? key}) : super(key: key);

  @override
  State<OtpVerification> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<OtpVerification> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                       const SizedBox(height: 20,),
                Row(
                  children: [
                    SizedBox(
                      width: 20.0,
                    ),
                    Center(
                      child: const Icon(
                        Icons.arrow_back,
                        size: 20,
                       color: Color.fromARGB(255, 3, 52, 4),
                      ),
                    ),
                    SizedBox(
                      width: 80.0,
                    ),
                    Image.asset(
                      'images/elevatelogo.png',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('OTP VERIFICATION!',
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Times New Roman',
                          fontWeight: FontWeight.w500,
                        ),
                        speed: const Duration(
                          milliseconds: 450,
                        )),
                  ],
                  onTap: () {
                    debugPrint("Welcome back!");
                  },
                  isRepeatingAnimation: true,
                  totalRepeatCount: 2,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Text(
                      'We just send you 4 digits code to your email'),
                ),
                  Container(
                  child: Text(
                      'example@example.com',style: TextStyle(fontWeight: FontWeight.bold),),
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
                                  color: Color.fromARGB(255, 188, 191, 188)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            // Set border for focused state
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3,
                                  color: Color.fromARGB(255, 188, 191, 188)),
                              borderRadius: BorderRadius.circular(15),
                            )
                            
                            ),
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
                            color: Color.fromARGB(255, 3, 52, 4),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Text('Don\'t have an account?'),
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
                                color: Color.fromARGB(255, 12, 114, 14),
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
