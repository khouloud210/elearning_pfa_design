// ignore_for_file: use_decorated_box, always_declare_return_types, require_trailing_commas

import 'package:e_learning_app/color_lib/game/lunch_game.dart';
import 'package:e_learning_app/math_lib/utils/colorConst.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class IntroGame extends StatefulWidget {
  const IntroGame({Key? key}) : super(key: key);

  @override
  State<IntroGame> createState() => _IntroGameState();
}

class _IntroGameState extends State<IntroGame> {
  @override
  void dispose() {
   
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/images/collll.jpg')
              ,),),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Text(
                  'Color Matching',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 65,
                   color: baseColor,
                   fontWeight: FontWeight.w500,
                    fontFamily: 'CabinSketch',
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
               
                padding: const EdgeInsets.only(top: 40, left: 4, right: 4),
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: InkWell(
                  onTap: () => _gotoLaunchScreen(),
                  child: const Text(
                    'Start',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'CabinSketch',
                      
                      color: baseColorLight,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _gotoLaunchScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LaunchScreen()));
  }
}
