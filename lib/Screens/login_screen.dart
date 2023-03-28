import 'dart:convert';
import 'dart:core';
import 'package:email_validator/email_validator.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:learnerapp/Screens/all_sub.dart';
import 'package:learnerapp/Screens/resetpassword.dart';
import 'package:learnerapp/Utilities/routes.dart';
import 'package:http/http.dart' as http;
import '../Services/login_api.dart';
import 'user_subject.dart';
import 'oldhome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int? response;
  bool _isObscure = true;
  bool visible = false;
  bool isValidForm = false;
  String? password;
  String? confirmpassword;
  String? gtoken;
  

  // ignore: annotate_overrides
  void initState() {
    super.initState();
    // getStatus();
  }

  // Getting value from TextField widget.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  getStatus(BuildContext context) async {
    var params = {
      "email": "dilini@gmail.com",
      "password": "123456aA",
      "status": "1",
    };

    var response1 = await http.get(
      Uri.parse(
        'http://fca.systemiial.com/api/login?email=${emailController.text}&password=${passwordController.text}&status=1',
      ),
    );
    var client = http.Client();

    // print(response1.body);
    var data = jsonDecode(response1.body.toString());
    // print("This is My email ${data["data"]["email"]}");
    // print("This is My password ${mypass}");

    print("My token: ${data["access_token"]}");
    print("My email is: ${data["user"]["email"]}");
    response = response1.statusCode;
    print(data);
    // print("This is my email: ${data["email"]}");
   
    print("Login Method Test Print");

    if (passwordController.text == '' || emailController.text == "") {
      const snackBar = SnackBar(content: Text("Empty Email Or Password"));

      return ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      if(data["access_token"]==null){
       
const snackBar = SnackBar(content: Text("Enter Correct Crendentials"));
      return ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      else if(data["access_token"]!=null){
        const snackBar = SnackBar(content: Text("Login success"));
          // ignore: use_build_context_synchronously
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainHomePage2(token2: data["access_token"],)),    
      );
      // // ignore: use_build_context_synchronously
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => ResetPassword(token4: data["access_token"],)),
      // );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      else{
            const snackBar = SnackBar(content: Text("Enter Correct Crendentials"));
      return ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
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
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return SafeArea(
                child: GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
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
                          children: [
                            // SizedBox(width: 80,),
                            const Padding(
                              padding: EdgeInsets.only(left: 100),
                              child: Text(
                                'Welcome Back,',
                                style: TextStyle(
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
                                children: const [ Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 28.26,
                                      decoration: TextDecoration.underline,
                                      // fontStyle: FontStyle.italic,
                                      // fontFamily: 'Times New Roman',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'for Continue !',
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
                          child: Form(
                            key: _formkey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: emailController,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                      hintText: 'Enter Your Username/Email',
                                      labelText: 'Email or Username',
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
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (inputValue) {
                              if (inputValue!.isEmpty) {
                                return "Enter email";
                              }
                              return null;
                            },
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  obscureText: _isObscure,
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                          color: const Color(0xFF045a4f),
                                          icon: Icon(
                                            _isObscure
                                              ? Icons.visibility
                                              : Icons.visibility_off),
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
                                          color: Color(0xFFDFE9E8),
                                          width: 3,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      // Set border for focused state
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 3, color: Color(0xFFDFE9E8)),
                                        borderRadius: BorderRadius.circular(15),
                                      )
                                      ),
                                       validator: (inputValue) {
                         
                              if (inputValue!.isEmpty) {
                                return "Enter password";
                              }
                              else if (inputValue.length<8)
                              {
                                return "Enter at least 8 letters";
                              }
                              return null;
                            },
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
                                  // onPressed: (() {
                                  //   getStatus(context);
                                  // }
                                  // ),
                                  onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    setState(() {
                                      isValidForm = true;
                                    });
                                    getStatus(context);
                                  } else {
                                    setState(() {
                                      isValidForm = false;
                                    });
                                    getStatus(context);
                                  }
                                },
                                  child: Container( alignment: Alignment.center, width: 400, height: 50, 
                                  child:Text('Sign In', style: TextStyle( fontSize: 18, color: Colors.white, ),),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF045a4f),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                ),
                                Row(
                                  // ignore: sort_child_properties_last
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
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
