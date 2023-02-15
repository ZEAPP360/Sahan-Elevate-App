import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:learnerapp/Utilities/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                    const SizedBox(
                      width: 20.0,
                    ),
                    Container(
                      width: 40.0,
                      child: MaterialButton(
                        minWidth: 2,
                        shape: const CircleBorder(),
                        color: const Color.fromARGB(255, 12, 114, 14),
                        padding: const EdgeInsets.all(20),
                        onPressed: () {},
                        child: const Center(
                          child: Icon(
                            Icons.arrow_back,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 80.0,
                    ),
                    Image.asset(
                      'images/elevatelogo.png',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Welcome Back, login for Continue!',
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
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 32,
                  ),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            hintText: 'Enter Your Username/Email',
                            labelText: 'Email or Username',
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
                      TextField(
                        obscureText: _isObscure,
                       
                        decoration: InputDecoration(
      
                suffixIcon: IconButton(
                    icon: Icon(
                      
                        _isObscure ? Icons.visibility : Icons.visibility_off
                        , color: const Color.fromARGB(255, 3, 52, 4)
                        ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    })  ,
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
                            
                            )
                            
                            ),
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10.0,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, MyRoutes.forgotPassword);
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: (() {
                          Navigator.pushNamed(context, MyRoutes.waiting);
                        }),
                        child: Container(
                          alignment: Alignment.center,
                          width: 400,
                          height: 50,
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 3, 52, 4),
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
                                MyRoutes.otpVerification,
                              );
                            }),
                            child: const Text(
                              'Sign Up here',
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
