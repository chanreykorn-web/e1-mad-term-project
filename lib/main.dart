import 'package:flutter/material.dart';
import 'package:flutter_application_1/ScreenLogin.dart';

// import 'package:flutter_application_1/ScreenWelcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff7d3c98)),
        scaffoldBackgroundColor: Color(0xfffdfefe),
        fontFamily: 'Outfit', // set background color here
      ),
      home: Screenlogin(),
    );
  }
}
