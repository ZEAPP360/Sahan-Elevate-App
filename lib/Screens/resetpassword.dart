import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:learnerapp/Utilities/routes.dart';
import 'package:http/http.dart' as http;
import '../Services/resetpass_api.dart';

// ignore: must_be_immutable
class ResetPassword extends StatefulWidget {
  String? token5;

  ResetPassword({this.token5, super.key});

  @override
  // ignore: no_logic_in_create_state
  State<ResetPassword> createState() => _ResetPasswordState(token5);
}

class _ResetPasswordState extends State<ResetPassword> {
    String? token5;
    _ResetPasswordState(this.token5);

  bool _isObscure = true;
  bool _isObscure2 = true;
  bool visible = false;
  bool isValidForm = false;
  String? password;
  String? confirmPassword;


  final pass1= TextEditingController();
  final pass2= TextEditingController();
  final _formkey= GlobalKey<FormState>();
  
 // ignore: annotate_overrides
  void initState() {
    super.initState();
    getReset();
  }

  Future<Reset> getReset() async {
    var params = {"token": "$token5"};
    var response1 = await http.post(
        Uri.parse(
          'http://fca.systemiial.com/api/reset-password',
        ),
      body: {
          'password': pass2.text,
          'token': token5.toString(),
        });

    var client = http.Client();
    print(response1.body);
    var data = jsonDecode(response1.body.toString());
  
    print("Reset Password token recieved:   $token5");
    if (response1.statusCode == 200) {
      return Reset.fromJson(data);
    } else {
      return Reset.fromJson(data);
    }
  }

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

                            // Navigator.pushNamed(
                            //     context,
                            //     MyRoutes.waiting,
                            //   );
                            Navigator.pop(context);
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
        child: GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
           const SizedBox(height: 30,),
                  // SizedBox(
                  //   height: 40,
                  // ),
                 const Text('Reset Password',
                  style: TextStyle(
                            color: Colors.black,
                            fontSize: 28.26,
                            // fontStyle: FontStyle.italic,
                            // fontFamily: 'Times New Roman',
                            fontWeight: FontWeight.w500,
                  ),),
                
               const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 32,
                    ),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          // Note: Same code is applied for the TextFormField as well
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        //////////////////////////////////////////////////////////////////////////////////////////////////////////
                          TextFormField(
                            obscureText: _isObscure,
                            controller: pass1,
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
                                hintText: 'New Password',
                                labelText: 'New Password',
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
                                )
                                ),
                                        validator: (inputValue) {
                                          
                              // inputValue=password;       
                              if (inputValue!.isEmpty ) {
                                
                                return "Enter password";
                              }
                              else if (inputValue.length<8)
                              {
                                return "Enter at least 8 letters";
                              }                        
                              // else if (pass1 != pass2)
                              // {
                              //   return "Password doesnt match";
                              // }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10,),
                                    Container(
                      child: const Text(
                          '(Enter a 8 or more characters long password)',style: TextStyle(fontSize: 16,
                             color: Color(0xffA5AABB),
                          ),
                          
                          ),
                                    ),
                                    const SizedBox(
                      height: 20,
                                    ),
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        //////////////////////////////////////////////////////////////////////////////////////////////////////////                                 
                       TextFormField(
                        obscureText: _isObscure2,
                        controller: pass2,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                          color: const Color(0xFF045a4f),
                                          icon: Icon(
                                            _isObscure2
                                              ? Icons.visibility
                                              : Icons.visibility_off),
                                          onPressed: () {
                                            setState(() {
                                              _isObscure2 = !_isObscure2;
                                            });
                                          }),
                                hintText: 'Re enter the new password',
                                labelText: 'Re enter the new password',
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
                                )
                                ),
                                         validator: (inputValue) {
                              // inputValue=confirmPassword; 
                              if (inputValue!.isEmpty) {
                                return "Enter password";
                              }
                              else if (inputValue.length<8)
                              {
                                return "Enter at least 8 letters";
                              }
                              else if (pass1.text!=pass2.text)
                              {
                                   print("This is Password: ${pass1.text}");
                                   print("This is Password Confirm: ${pass2.text}");
                                   print("Password doesnt match");
                          return "Password does not match";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20.0,),


                          // Text("Tokennnn $token5"),
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                          TextButton(
                                      onPressed: () {
                                    if (_formkey.currentState!.validate()) {
                                      setState(() {
                                        isValidForm = true;
                                      });
                                      // Navigator.pushNamed(context, MyRoutes.otpVerification);
                                      getReset();
                                    } else {
                                      setState(() {
                                        isValidForm = false;
                                      });                             
                                    }
                                  },
                            // onPressed: (() {
                            //   Navigator.pushNamed(context, MyRoutes.otpVerification);
                            // }),
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
                                   color:Color(0xFF045a4f),
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                       
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
