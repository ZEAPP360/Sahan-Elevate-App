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
  bool _isObscure2 = true;
  bool visible = false;
  bool isValidForm = false;
  String? password;
  String? confirmPassword;

  final pass1= TextEditingController();
  final pass2= TextEditingController();
  final _formkey= GlobalKey<FormState>();

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
           SizedBox(height: 30,),
                  // SizedBox(
                  //   height: 40,
                  // ),
                  Text('Reset Password',
                  style: TextStyle(
                            color: Colors.black,
                            fontSize: 28.26,
                            // fontStyle: FontStyle.italic,
                            // fontFamily: 'Times New Roman',
                            fontWeight: FontWeight.w500,
                  ),),
                
                SizedBox(height: 20,),
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
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                          TextButton(
                                      onPressed: () {
                                    if (_formkey.currentState!.validate()) {
                                      setState(() {
                                        isValidForm = true;
                                      });
                                      Navigator.pushNamed(context, MyRoutes.otpVerification);
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
