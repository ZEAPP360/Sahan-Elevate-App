// import 'package:cfula/screens/auth/screens/SVSignInScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:learnerapp/Screens/waitingpage.dart';
// import 'package:nb_utils/nb_utils.dart';


// class SVSplashScreen extends StatefulWidget {
//   const SVSplashScreen({Key? key}) : super(key: key);

//   @override
//   State<SVSplashScreen> createState() => _SVSplashScreenState();
// }

// class _SVSplashScreenState extends State<SVSplashScreen> {
//   @override
//   void initState() {
//     init();
//     super.initState();
//   }

//   Future<void> init() async {
//     setStatusBarColor(Colors.transparent);
//     await 3.seconds.delay;
//     finish(context);
//     Waiting.launch(context,isNewTask: true);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         alignment: Alignment.center,
//         children: [
//           Image.asset(
//             'images/socialv/svSplashImage.jpg',
//             height: context.height(),
//             width: context.width(),
//             fit: BoxFit.fill,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset('images/socialv/5.jpg', height: 50, width: 52, fit: BoxFit.cover, color: Colors.white),
//               8.width,
//               Text("CFULA", style: primaryTextStyle(color: Colors.white, size: 40, weight: FontWeight.w500)),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
