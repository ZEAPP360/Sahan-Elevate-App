import 'dart:convert';
import '../Services/forgotpass_api.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:learnerapp/Utilities/routes.dart';
import 'package:http/http.dart' as http;

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<ForgotPassword> {
  bool _isObscure = true;
  bool isValidForm = false;
  bool visible = false;
  String? forgotToken;

  var email = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // ignore: annotate_overrides
  void initState() {
    super.initState();
    getForgot();
  }

  Future<ForgotPassword2?> getForgot() async {
    email = TextEditingController();
    // ignore: unused_local_variable
    var params = {"email": email};
    var response = await http.get(
      Uri.parse(
        'http://fca.systemiial.com/api/forgot-password?email=dilini@gmail.com',
      ),
    );
    var client = http.Client();
    var data = jsonDecode(response.body.toString());

    String? forgotToken = "${data["data"]["forgot_token"]}";
    print("This is Forgot Token:   ${data["data"]["forgot_token"]}");
    print("Forgot Password Response:   ${response.body}");
    print(forgotToken);

    if (response.statusCode == 200) {
      return ForgotPassword2.fromJson(data);
    } else {
      // ignore: use_build_context_synchronously
      return showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Error'),
          content: Text('An error occurred. Please try again later.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );;
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
            color: Color(0xFF045a4f),
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
                        style:
                            TextStyle(color: Color(0xffA5AABB), fontSize: 20),
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
                          TextFormField(
                            controller: email,
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
                                // Navigator.pushNamed(context, MyRoutes.waiting);
                                getForgot();
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    title: Text('Password Reset'),
                                    content: Text(
                                        'An email has been sent with instructions to reset your password.'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                setState(() {
                                  isValidForm = false;
                                });
                              }
                            },
                            // onPressed: (() {
                            //   Navigator.pushNamed(context, MyRoutes.waiting);
                            // }),
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
                              Text('Don\'t recieve the Code ?'),
                              TextButton(
                                onPressed: (() {
                                  // Navigator.pushNamed(
                                  //   context,
                                  //   MyRoutes.resetpassword,
                                  // );
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
        ),
      ),
    );
  }
}
