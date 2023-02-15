import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:learnerapp/Utilities/routes.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<ResetPassword> {
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
                    Container(
                      width: 40.0,
                      child: MaterialButton(
                        minWidth: 2,
                        shape: const CircleBorder(),
                        color: Color.fromARGB(255, 12, 114, 14),
                        padding: const EdgeInsets.all(20),
                        onPressed: () {},
                        child: Center(
                          child: const Icon(
                            Icons.arrow_back,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
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
                    TypewriterAnimatedText('Reset Password!',
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
              SizedBox(height: 20,),
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
                  
                            hintText: 'New Password',
                            labelText: 'New Password',
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
                      SizedBox(height: 10,),
                Container(
                  child: Text(
                      '(Enter a 8 or more characters long password)'),
                ),
                SizedBox(
                  height: 20,
                ),
                 
   TextField(
                        decoration: InputDecoration(
                  
                            hintText: 'Re enter the new password',
                            labelText: 'Re enter the new password',
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
                      SizedBox(height: 20.0,),
                      TextButton(
                        onPressed: (() {
                          Navigator.pushNamed(context, MyRoutes.waiting);
                        }),
                        child: Container(
                          alignment: Alignment.center,
                          width: 400,
                          height: 50,
                          child: Text(
                            'SAVE AND SIGN IN',
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
