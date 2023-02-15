import 'package:flutter/material.dart';
import 'package:learnerapp/Screens/forgot_password.dart';
import 'package:learnerapp/Screens/home_screen.dart';
import 'package:learnerapp/Screens/login_screen.dart';
import 'package:learnerapp/Screens/resetpassword.dart';
import 'package:learnerapp/Screens/signup.dart';


import 'package:learnerapp/Screens/waitingpage.dart';
import 'package:learnerapp/Utilities/routes.dart';


void main() => runApp(const AuthApp());

class AuthApp extends StatelessWidget {
  const AuthApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
  
      initialRoute: '/',
      routes: {
        MyRoutes.homeScreen: (context) => HomeScreen(),
        MyRoutes.loginScreen: (context) => LoginScreen(),
        MyRoutes.signUp: (context) => SignUp(),
        MyRoutes.forgotPassword: (context) => ForgotPassword(),
        MyRoutes.waiting:(context) => Waiting(),
        MyRoutes.resetpassword:(context) => ResetPassword()
      },
    );
  }
}
