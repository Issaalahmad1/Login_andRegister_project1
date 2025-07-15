import 'package:flutter/material.dart';
import 'package:login_and_register_screen/screens/login_screen.dart';
import 'package:login_and_register_screen/screens/register_screen.dart';
import 'package:login_and_register_screen/screens/welcom_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomScreen(),
      routes: {
        "WelcomScreen":(context)=>WelcomScreen(),
        "LoginScreen":(context)=>LoginScreen(),
        "RegisterScreen":(context)=>RegisterScreen(),
      },
    );
  }
}
