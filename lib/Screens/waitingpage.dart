import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:learnerapp/Utilities/routes.dart';

class Waiting extends StatefulWidget {
  const Waiting({Key? key}) : super(key: key);

  @override
  State<Waiting> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Waiting> {
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
                    TypewriterAnimatedText('Waiting........',
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
        
                     
                    ],
                  ),
                ),
              
            ),
          ),
    );
  }
}
