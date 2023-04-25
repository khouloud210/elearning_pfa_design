import 'package:e_learning_app/color_lib/main.dart';
import 'package:e_learning_app/kid_lib/main.dart';
import 'package:e_learning_app/math_lib/main.dart';
import 'package:e_learning_app/puzzle_lib/src/my_app.dart';
import 'package:e_learning_app/voice_lib/main.dart';
import 'package:flutter/material.dart';

import '../clock_lib/main.dart';

class Product {
  final String image, title;
  final int id, courses;
  final Color color;
  // ignore: prefer_typing_uninitialized_variables
  var game;

  Product({
    required this.image,
    required this.title,
    required this.courses,
    required this.color,
    required this.id,
    required this.game,
  });
}

List<Product> products = [
  Product(
    id: 1,
    title: 'Graphic Design',
    image: 'assets/images/graphics.png',
    color: const Color(0xFF71b8ff),
    courses: 16,
    game: const MyPuzzle(),
  ),
  Product(
    id: 2,
    title: 'Programming',
    image: 'assets/images/programming.png',
    color: const Color(0xFFff6374),
    courses: 22,
    game: const MyMath(),
  ),
  Product(
    id: 3,
    title: 'Finance',
    image: 'assets/images/finance.png',
    color: const Color(0xFFffaa5b),
    courses: 15,
    game: const AppClock(),
  ),
  Product(
    id: 4,
    title: 'Text to speech',
    image: 'assets/images/ux.png',
    color: const Color(0xFF9ba0fc),
    courses: 18,
    game: const MyTextToSpeechApp(),
  ),
  Product(
    id: 5,
    title: 'speech to Text ',
    image: 'assets/images/ux.png',
    color: const Color.fromARGB(255, 170, 11, 146),
    courses: 18,
    game: const Myvoice(),
  ),
  Product(
    id: 6,
    title: 'Color matching',
    image: 'assets/images/ux.png',
    color: const Color.fromARGB(255, 3, 23, 90),
    courses: 18,
    game: const Mycolor(),
  ),
];
