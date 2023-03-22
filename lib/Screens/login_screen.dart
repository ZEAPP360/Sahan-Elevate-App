import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:learnerapp/Screens/mainhomepage.dart';
import 'package:learnerapp/Utilities/routes.dart';
import 'package:http/http.dart' as http;

import '../login_api.dart';
import 'oldhome.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   String? token1;

   bool _isObscure = true;
   bool visible = false;

 void initState() {
    super.initState();
    getStatus();
  }
  
  // Getting value from TextField widget.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<Welcome> getStatus() async {
    var params = {
    "email": "dilini@gmail.com",
    "password":"123456aA",
    "status": "1",
    };
    var response1 = await http.get(
        Uri.parse(
          'http://fca.systemiial.com/api/login?email=${emailController.text}&password=${passwordController.text}&status=1',),);
    var client = http.Client();
    // print(response1.body);
    var data = jsonDecode(response1.body.toString());

  // print("My token: ${data["access_token"]}");

    if (response1.statusCode == 200) {
       setState(() {
        token1= data["access_token"];
      });
      // print("This is my token:  $token1");
      return Welcome.fromJson(data);
     
    } else {
      return Welcome.fromJson(data);
    }
  }

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
      body: FutureBuilder<Welcome>(
        future: getStatus(),
        builder: (context, snapshot){
          return ListView.builder(
            itemCount: 1,
            itemBuilder:(context, index){
return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
       SizedBox(height: 50,),
          //     Row(
          //       children: [
          //       Container(
          //           width: 100.0,
          //           child: MaterialButton(
          //             minWidth: 2,
          //             shape: const CircleBorder(),
          // color:Color(0xFF045a4f),
          //             padding: const EdgeInsets.all(10),
          //             onPressed: () {

          //                 Navigator.pushNamed(
          //                     context,
          //                     MyRoutes.waiting,
          //                   );
          //             },
          //             child: Icon(
          //               Icons.arrow_back,
          //               size: 20,
          //               color: Colors.white,
          //             ),
          //           ),
          //         ),
          //         const SizedBox(
          //           width: 1,
          //         ),
          //   Container(
          //     margin: const EdgeInsets.fromLTRB(15,0,0,0),
          //     child: const Image(
          //       height: 200,
          //       image: AssetImage(
          //             'images/elevatelogo.png'),
          //     ),
          //   ),
          //       ],
          //     ),
              // const SizedBox(
              //   height: 1,
              // ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: 
              
                [
                  
                  // SizedBox(width: 80,),
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Text('Welcome Back,',
                  style:  TextStyle(
                              color: Colors.black,
                   fontSize: 28.26,
                              // fontStyle: FontStyle.italic,
                              // fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.w500,
                            ),
                  
                  ),
                ),
                //   AnimatedTextKit(
                //     animatedTexts: [
                //       TypewriterAnimatedText('Welcome Back, ',
                //           textStyle: const TextStyle(
                //             color: Colors.black,
                //  fontSize: 28.26,
                //             // fontStyle: FontStyle.italic,
                //             // fontFamily: 'Times New Roman',
                //             fontWeight: FontWeight.w500,
                //           ),
                //           speed: const Duration(
                //             milliseconds: 450,
                //           )),
                //     ],
                //     onTap: () {
                //       debugPrint("Welcome back!");
                //     },
                //     isRepeatingAnimation: true,
                //     totalRepeatCount: 2,
                //   ),
                    Padding(
                      padding: const EdgeInsets.only(left: 80),
                      child: Row(
                        children: [
                          Text('Login',
                
                style:  TextStyle(
                                  color: Colors.black,
                                   fontSize: 28.26,
                                   decoration: TextDecoration.underline,
                                  // fontStyle: FontStyle.italic,
                                  // fontFamily: 'Times New Roman',
                                  fontWeight: FontWeight.w500,
                                ),),
                                SizedBox(width: 5,),
                                  Text('for Continue !',
                
                style:  TextStyle(
                              color: Colors.black,
                               fontSize: 28.26,
                              // fontStyle: FontStyle.italic,
                              // fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.w500,
                            ),)
                        ],
                      ),
                    ),

              

                ],
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
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: 'Enter Your Username/Email',
                          labelText: 'Email or Username',
                          // Set border for enabled state (default)
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                 color:Color(0xFFDFE9E8),),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          // Set border for focused state
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                   color:Color(0xFFDFE9E8),),
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      obscureText: _isObscure,
                     controller: passwordController,
                      decoration: InputDecoration(
      
           
              suffixIcon: IconButton(
                    color:  Color(0xFF045a4f),
                    icon: Icon(
                    
                        _isObscure ? Icons.visibility : Icons.visibility_off),
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
                                 color:Color(0xFFDFE9E8),
                                width: 3,
                               ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          // Set border for focused state
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                             
                                color:Color(0xFFDFE9E8)
                                ),
                            borderRadius: BorderRadius.circular(15),
                          
                          )
                          
                          ),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 200.0,
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
                    // getStatus();
                    // print('body: $token1');
                    // print('success login');
                              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MainHomePage(token2: snapshot.data?.accessToken)),
                            );
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
                             color:Color(0xFF045a4f),
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
                              MyRoutes.signUp,
                            );
                          }),
                          child: const Text(
                            'Sign Up here',
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
      );
            }
          );
        })
    );
  }
}