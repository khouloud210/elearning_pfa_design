import 'package:e_learning_app/kid_lib/screens/home.dart';
import 'package:flutter/material.dart';
//import 'package:e_learning_app/kid_lib/constant.dart';
// ignore: depend_on_referenced_packages
//import 'package:e_learning_app/kid_lib/screens/home.dart';


import 'constant.dart';

void main() => runApp(const MyTextToSpeechApp());

class MyTextToSpeechApp extends StatelessWidget {
  const MyTextToSpeechApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KidStarter',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: 'CabinSketch',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: kBodyTextColor),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
