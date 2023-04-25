import 'package:e_learning_app/color_lib/game/intro_game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Mycolor());
}

class Mycolor extends StatelessWidget {
  const Mycolor({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const IntroGame(),
    );
  }
}
