import 'package:flutter/material.dart';
import 'HomeScreen.dart';

void main() => runApp(const MyMath());

class MyMath extends StatelessWidget {
  const MyMath({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mathematics',
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const HomeScreen(),
    );
  }
}
