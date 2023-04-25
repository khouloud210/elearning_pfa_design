// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:e_learning_app/color_lib/game/lunch_game.dart';
import 'package:e_learning_app/color_lib/game/play_screen.dart';
import 'package:e_learning_app/color_lib/model/level.dart';
import 'package:e_learning_app/color_lib/repository/boxes.dart';
import 'package:e_learning_app/constants.dart';
import 'package:flutter/material.dart';

import '../../math_lib/utils/colorConst.dart';
import '../model/state.dart';

class LostScreen extends StatefulWidget {
  final Stats stats;

  const LostScreen({
     Key? key,
    required this.stats,
  }): super(key: key);
  @override
  State<LostScreen> createState() => _LostScreenState();
}

class _LostScreenState extends State<LostScreen> {
  late Stats stats;
  @override
  void initState() {
    super.initState();
    stats = widget.stats;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: use_decorated_box
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, 
              image: AssetImage('assets/images/collll.jpg'),),),
      child: Scaffold(
           backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 150,
                      ),
                      Text(
                        'Y O U  ${stats.statuse}',
                        style: const TextStyle(
                          fontSize: 60,
                          color: baseColor,
                          fontFamily: 'Kiddy',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        ' Level : ${stats.level}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                       Text(
                        ' Score : ${stats.score}/${stats.points}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: MediaQuery.of(context).size.height * 0.32,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(
                       'assets/images/lose.png',
                        
                    ),
                  ),
                ),
              ),

              //nextLevel  btn
            /*  Container(
              
                margin: const EdgeInsets.only(
                   top: 10,
                  right: 5,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 2,
                ),
                child: InkWell(
                  // onTap: () {
                  //   double prevLevel = stats.level - 1;

                  //   Widget screen;
                  //   if (prevLevel > 0) {
                  //     screen = PlayScreen(
                  //       level: Level(
                  //         id: prevLevel,
                  //         duration: Boxes().levelDuration(prevLevel),
                  //         points: Boxes().levelPoints(prevLevel),
                  //       ),
                  //     );
                  //   } else {
                  //     screen = LaunchScreen();
                  //   }
                  //   LaunchScreen();
                  // },
                  onTap: () => _loadScreen(const LaunchScreen()),
                  child: const Text(
                    'resset',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.yellowAccent,
                    ),
                  ),
                ),
              ),*/

              // // المستوى السابق btn
              Container(
                
                margin: const EdgeInsets.only(
                  top: 20,
                  right: 5,
                  left: 5,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 2,
                ),
                child: InkWell(
                  onTap: () {
                    // double preventLevel = stats.level - 1;
                    double preventLevel = stats.level.toDouble();
                    // double preventLevel =  removeTrailPoints(preventLevel).toDouble();
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
                      color: kpink,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              Container(
               
                margin: const EdgeInsets.only(
                  top: 25,
                  right: 5,
                  left: 5,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 2,
                ),
                child: InkWell(
                  onTap: () {
                    //just for test this line doing
                    double preventLevel = stats.level - -1;
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
                    'NEXT LEVEL TEST',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      color: kpink,
                      fontWeight: FontWeight.bold,
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
                      color: kpink
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

// num removeTrailPoints(double val) {
//     return val % 1 == 0 ? val.toInt() : val;
//   }
  _loadScreen(Widget screen) {
    Navigator.of(context).pop();
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }
}
