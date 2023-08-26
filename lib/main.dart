import 'package:flutter/material.dart';
import 'package:task3_project/screens/forget_screen.dart';
import 'package:task3_project/screens/home_screen.dart';
import 'package:task3_project/screens/login_screen.dart';
import 'package:task3_project/screens/register_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        useMaterial3:true,
      ),

      initialRoute: LoginScreen.id,
      routes: {
        RegisterScreen.id:(BuildContext context)=>RegisterScreen(),
        LoginScreen.id:(BuildContext context)=>LoginScreen(),
        HomeScreen.id:(BuildContext context)=>HomeScreen(),
        ForgetScreen.id:(BuildContext context)=>ForgetScreen(),
      },

    );
  }
}