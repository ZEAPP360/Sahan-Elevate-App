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
    return Scaffold(
       appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: MaterialButton(
                        minWidth: 2,
                        shape: const CircleBorder(),
            color:Color(0xFF045a4f),
                        padding: const EdgeInsets.all(5),
                        onPressed: () {
                         Navigator.pop(context);
                            // Navigator.pushNamed(
                            //     context,
                            //     MyRoutes.waiting,
                            //   );
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            SizedBox(height: 30,),
              Text('Waiting.....',
              style: TextStyle(
                          color: Colors.black,
                            fontSize: 28.26,
                          // fontStyle: FontStyle.italic,
                          // fontFamily: 'Times New Roman',
                          fontWeight: FontWeight.w500,
                        ),
              )
               
        
                     
                    ],
                  ),
                ),
              
            ),
          ),
    );
  }
}
