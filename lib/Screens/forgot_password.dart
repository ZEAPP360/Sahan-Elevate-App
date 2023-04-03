import 'dart:convert';
import 'package:learnerapp/Screens/login_screen.dart';
import '../Services/forgotpass_api.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:learnerapp/Utilities/routes.dart';
import 'package:http/http.dart' as http;

import 'reset_forgot_password.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<ForgotPassword> {
  bool _isObscure = true;
  bool isValidForm = false;
  bool visible = false;
  String? forgotToken = '';

  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // ignore: annotate_overrides
  // void initState() {
  //   super.initState();
  //   getForgot();
  // }

  Future<ForgotPassword2?> getForgot() async {
    // ignore: unused_local_variable
    var params = {"email": emailController.text};
    var response = await http.get(
      Uri.parse(
        'http://fca.systemiial.com/api/forgot-password?email=${emailController.text}',
      ),
    );
    var client = http.Client();
    var data = jsonDecode(response.body.toString());

    // forgotToken = "${data["data"]["forgot_token"]}";
    // print("This is Forgot Token:   ${data["data"]["forgot_token"]}");
    // print("Forgot Password Response:   ${response.body}");
    // print(forgotToken);

    //  String? Code= "${data["data"]["forgot_token"]}";
    //  print("Code:   ${data["success"]}");

    // if (response.statusCode == 200) {
    //   return ForgotPassword2.fromJson(data);
    // }
    if (data["success"] == true) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Password Reset'),
          content: const Text(
              'An email has been sent with instructions to reset your password.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
          ],
        ),
      );
      return ForgotPassword2.fromJson(data);
    } else {
      // ignore: use_build_context_synchronously
      return showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Error'),
          content: const Text('An error occurred. Please try correct email.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
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
            color: const Color(0xFF045a4f),
            padding: const EdgeInsets.all(5),
            onPressed: () {
              Navigator.pushNamed(
                context,
                MyRoutes.loginScreen,
              );
            },
            child: const Center(
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
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: SingleChildScrollView(
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'Forgot Password',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28.26,
                        // fontStyle: FontStyle.italic,
                        // fontFamily: 'Times New Roman',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: const Text(
                        'Enter your email address to reset the  ',
                        style:
                            TextStyle(color: Color(0xffA5AABB), fontSize: 20),
                      ),
                    ),
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: const Text(
                        'password',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
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
                          // Note: Same code is applied for the TextFormField as well
                          TextFormField(
                            controller: emailController,
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
                            height: 30,
                          ),

                          TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  isValidForm = true;
                                });
                                getForgot();
                              } else {
                                setState(() {
                                  isValidForm = false;
                                });
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 400,
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xFF045a4f),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: const Text(
                                'SEND',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          // Text("This is forgot token: $forgotToken"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don\'t recieved the code ?'),
                              TextButton(
                                onPressed: (() {
                                  Navigator.pushNamed(
                                    context,
                                    MyRoutes.otpVerification,
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
