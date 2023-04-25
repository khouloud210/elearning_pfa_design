// ignore_for_file: public_member_api_docs, sort_constructors_first, use_decorated_box, prefer_final_locals, always_declare_return_types

import 'package:e_learning_app/color_lib/game/lunch_game.dart';
import 'package:e_learning_app/color_lib/game/play_screen.dart';
import 'package:e_learning_app/color_lib/model/level.dart';
import 'package:e_learning_app/color_lib/repository/boxes.dart';
import 'package:e_learning_app/constants.dart';
import 'package:e_learning_app/math_lib/utils/colorConst.dart';
import 'package:flutter/material.dart';

import '../model/state.dart';

class WinScreen extends StatefulWidget {
  final Stats stats;

  const WinScreen({
    Key? key,
    required this.stats, // يستقبل بيانات النتيجة  لصفحة اعلان الفوز
  }): super(key: key);
  @override
  State<WinScreen> createState() => _WinScreenState();
}

class _WinScreenState extends State<WinScreen> {
  late Stats stats;
  @override
  void initState() {
    super.initState();
    stats = widget.stats;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/images/collll.jpg'),),),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                     Text(
                      'Y O U  ${stats.statuse}',
                      style: const TextStyle(
                        fontSize: 60,
                        color: baseColorLight,
                        fontFamily: 'CabinSketch',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ' Level : ${stats.level}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      
                    ),
                     Text(
                      ' Score :${stats.score}/${stats.points}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                     )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Container(
                  margin: const EdgeInsets.only(top: 15),
                  height: MediaQuery.of(context).size.height * 0.3,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: const BoxDecoration(
                    
                    // shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                          
                          'assets/images/congrats.gif',),
                    ),
                  ),
                ),
              ),
              //nextLevel  btn
              Container(
               
                margin: const EdgeInsets.only(
                top: 20,
                  right: 5,
                  
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 2,
                ),
                child: InkWell(
                  onTap: () {
                    double nextLevel = stats.level + 1;

                    PlayScreen screen = PlayScreen(
                        level: Level(
                      id: nextLevel,
                      duration: Boxes().levelDuration(nextLevel),
                      points: Boxes().levelPoints(nextLevel),
                    ),);

                    _loadScreen(screen);
                  },
                  child: const Text(
                    'NEXT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      color: kpink,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // nextLevel  btn
              Container(
                
                margin: const EdgeInsets.only(
                 top:25 ,
                  right: 5,
                  left: 6,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 5
                ),
                child: InkWell(
                  // onTap: () => _loadScreen(LaunchScreen()),
                  onTap: () {
                    // double preventLevel = stats.level - 1;
                    double preventLevel = stats.level.toDouble();
                    Widget screen;

                    if (preventLevel > 0) {
                      screen = PlayScreen(
                          level: Level(
                        id: preventLevel,
                        duration: Boxes().levelDuration(preventLevel),
                        points: Boxes().levelPoints(preventLevel),
                      ),);
                    } else {
                      screen = const LaunchScreen();
                    }
                    _loadScreen(screen);
                  },
                  child: const Text(
                    'PREVIOUS',
                    
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                                            fontWeight: FontWeight.bold,
                      color: kpink,
                    ),
                  ),
                ),
              ),

              //resset  btn
              Container(
               
                margin: const EdgeInsets.only(
                 top: 30,
                  right: 5,
                  left: 5,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 2,
                ),
                child: InkWell(
                  onTap: () => _loadScreen(const LaunchScreen()),
                  child: const Text(
                    'RESET',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                       fontWeight: FontWeight.bold,
                      color: kpink,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _loadScreen(Widget screen) {
    Navigator.of(context).pop();
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }
}
