import 'package:e_learning_app/color_lib/game/play_screen.dart';
import 'package:e_learning_app/color_lib/model/level.dart';
import 'package:e_learning_app/constants.dart';
import 'package:flutter/material.dart';

import '../../math_lib/utils/colorConst.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: use_decorated_box
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/collll.jpg"),),),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  
                 child: InkWell(
                      onTap: () => _gotoPlayescreen(),
                      child: const Text(
                        'Start Game',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 60,
                          color: baseColor,
                           fontWeight: FontWeight.w500,
                    fontFamily: 'CabinSketch',
                        ),
                      ),),),
              const SizedBox(
                height: 50,
              ),
              // Container(
              //     padding: const EdgeInsets.symmetric(horizontal: 8),
              //     decoration: BoxDecoration(
              //       border: Border.all(color: Colors.amber, width: 4),
              //       borderRadius: BorderRadius.all(Radius.circular(12)),
              //     ),
              //     child: Text(
              //       '4 levels Game',
              //       textAlign: TextAlign.center,
              //       style: TextStyle(
              //         fontSize: 50,
              //         color: Colors.white,
              //       ),
              //     )),
              // SizedBox(
              //   height: 25,
              // ),
              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 8),
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Colors.amber, width: 4),
              //     borderRadius: BorderRadius.all(Radius.circular(12)),
              //   ),
              //   child: Text(
              //     'upNextlevel 1  ',
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //       fontSize: 36,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
             
              
            ],
          ),
        ),
      ),
    );
  }

  _gotoPlayescreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlayScreen(
          level: Level(
            id: 1,
            name: "one",
            duration: 30,
            points: 25,
          ),
        ),
      ),
    );
  }
}
