import 'package:flutter/material.dart';
import 'package:learnerapp/Screens/forgot_password.dart';
import 'package:learnerapp/Screens/login_screen.dart';
import 'package:learnerapp/Screens/myprofile2.dart';
import 'package:learnerapp/Screens/otpverification.dart';
import 'package:learnerapp/Screens/profile.dart';
import 'package:learnerapp/Screens/questiion.dart';
import 'package:learnerapp/Screens/resetpassword.dart';
import 'package:learnerapp/Screens/showanswer.dart';
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
        // MyRoutes.drawer: (context) => Drawers(),
        MyRoutes.loginScreen: (context) => LoginScreen(),
        MyRoutes.signUp: (context) => SignUp(),
        MyRoutes.waiting: (context) => Waiting(),
        MyRoutes.resetpassword: (context) => ResetPassword(),
        MyRoutes.otpVerification: (context) => OtpVerification(),
        MyRoutes.myprofile: (context) => MyProfile(),
        MyRoutes.answer: (context) => MyAnswers(),
        MyRoutes.question: (context) => ShowAnswer() ,
        MyRoutes.forgotPassword: (context) => ForgotPassword() ,
        MyRoutes.profile2: (context) => Profile2() ,
      },
    );
  }
}
