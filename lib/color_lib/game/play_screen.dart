// ignore_for_file: public_member_api_docs, sort_constructors_first, unrelated_type_equality_checks
import 'dart:async';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:e_learning_app/color_lib/game/lost_screen.dart';
import 'package:e_learning_app/color_lib/game/won_screen.dart';
import 'package:e_learning_app/color_lib/model/box.dart';
import 'package:e_learning_app/color_lib/model/level.dart';
import 'package:e_learning_app/color_lib/model/state.dart';
import 'package:e_learning_app/color_lib/repository/boxes.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../math_lib/utils/colorConst.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({
    Key? key,
    required this.level,
  }) : super(key: key);
  final Level level;
  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
   int _selectedIndex = 0;
  List<Box> boxes = [];
  List<Box> opaqueBoxes = [];
  List<Box> choiceBoxes = [];
  final AudioPlayer player = AudioPlayer();
  late Level level;
  late Timer timer;
  double duration = 0;
  double score = 0;
  double minWin = 0;

  @override
  void initState() {
    super.initState();
    level = widget.level;
    boxes.addAll(Boxes().getBoxes(Boxes().numberOfBoxes(level.id)));
    // boxes.shuffle();
    opaqueBoxes.addAll(boxes);
    opaqueBoxes.shuffle();
    choiceBoxes.addAll(boxes);
    choiceBoxes.shuffle();
    duration = level.duration;
    minWin = 0.5 * level.points; //50% in level to be win
    setLevelTimer();
  }

  @override
  void dispose() {
    player.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: baseColorLight,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
        ),
        actions: [
          //level
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            margin: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
            child: Text(
              'Level ${removeTrailPoints(level.id)}',
              style: const TextStyle(
                fontSize: 30,
                fontFamily: 'CabinSketch',
              ),
            ),
          ),
          //score board
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            margin: const EdgeInsets.only(right: 30, top: 5, bottom: 5),
            child: Row(
              children: [
                Text(
                  ' ${removeTrailPoints(score)}/${removeTrailPoints(level.points)}',
                  style: const TextStyle(
                    fontSize: 30,
                    fontFamily: 'CabinSketch',
                  ),
                ),
              ],
            ),
          ),
          //Timer
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            margin: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
            
            child: Text(
              // double.parse('$duration').toInt().toString(),
              'Time ${removeTrailPoints(duration)}',
              style: const TextStyle(
                color: const Color(0XFFffff1a),
                fontSize: 30,
                fontFamily: 'CabinSketch',
              ),
            ),
          )
        ],
      ),
        bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          BottomNavyBarItem(
              icon: const Icon(Icons.home),
              title: const Text('Home'),
              activeColor: baseColorLight,
              inactiveColor: Colors.grey[300],
             
              ),
          BottomNavyBarItem(
            icon: const Icon(Icons.favorite_rounded),
            title: const Text('Favorite'),
            inactiveColor: Colors.grey[300],
            activeColor: baseColorLight,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.message),
            title: const Text('Messages'),
            inactiveColor: Colors.grey[300],
            activeColor: baseColorLight,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.person),
            title: const Text('Profile'),
            inactiveColor: Colors.grey[300],
            activeColor: baseColorLight,
          ),
        ],
      ),
      //  backgroundColor: Colors.transparent,
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/white.jpg'),),),
            padding: const EdgeInsets.all(
              8,
            ),
            child: Center(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 5,
                children: List.generate(
                    opaqueBoxes.length, (index) => _generateopaqueBoxes(index),),
              ),
            ),
          ),
        ),

        //choicecBox
        Expanded(
          child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/white.jpg'),),),
            padding: const EdgeInsets.all(
              8,
            ),
            child: Center(
              child: GridView.count(
                // shrinkWrap: true,
                crossAxisCount: 5,
                children: List.generate(
                    choiceBoxes.length, (index) => _generatChocesBoxes(index),),
              ),
            ),
          ),
        )
      ],
    );
  }

  setLevelTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        duration--;
      });
      //if  duration  is ended
      if (duration == 0) {
        //game ended check if lost or won
        gameLevelEnded(isWin());
        timer.cancel();
      }
    });
  }

// double.parse('$duration').toInt().toString(),
  num removeTrailPoints(double val) {
    return val % 1 == 0 ? val.toInt() : val;
  }

  // bool _willAccept(Box? data) {
  //   return true;
  // }

//
  Widget _generateopaqueBoxes(int index) {
    return DragTarget<Box>(
      builder: (BuildContext context, List<dynamic> accepted,
          List<dynamic> rejected,) {
        return opaqueBoxes.elementAt(index).filed
            ? _filBoxes(index)
            : _opaque(index);
      },
      onWillAccept: (data) {
        //data = color DragTarget<Box>
        bool accept = data?.name == opaqueBoxes.elementAt(index).name;
        playSFXBoxAccepted(accept);
        if (!accept && score == 1) {
          // IgnorePointer(
          //   ignoring: true,
          // );
          timer.cancel();
          gameLevelEnded(isWin());
        } else if (!accept && score > 0) {
          calculateScore(false);
          //Add deletion of the name and color when touching in case of wrongAnswer
          acceptBox(opaqueBoxes.elementAt(index));

          opaqueBoxes.removeAt(index).filed;
        }
        return accept; //When the element is accepted, it calculates the point and drops it on the target
      },
      // onWillAccept: _willAccept,
      onAccept: (d) {
        setState(() {
          calculateScore(true);
          opaqueBoxes.elementAt(index).filed = true;
          // opaqueBoxes.elementAt(index);
          acceptBox(opaqueBoxes.elementAt(index));
          opaqueBoxes.removeAt(index).name;

          //
          //check if this is the last box on level?
          if (isLevelEnd()) {
            gameLevelEnded(isWin());
          }
        });
      },
    );
  }
  //

  Widget _generatChocesBoxes(int index) {
    return Draggable<Box>(
      data: choiceBoxes.elementAt(index),
      feedback: Container(
        width: 80,
        height: 80,
        margin: const EdgeInsets.only(right: 4, bottom: 2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
          border: Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 3),
          color: choiceBoxes[index].color,
        ),
      ),
      childWhenDragging: Container(),
      child: Container(
        width: 80,
        height: 80,
        margin: const EdgeInsets.only(right: 4, bottom: 2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
          border: Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 2),
          color: choiceBoxes[index].color,
        ),
      ),
    );
  }

// الالوان
  Widget _filBoxes(int index) {
    return IgnorePointer(
      ignoring: true,
      child: Container(
        color: Colors.blueAccent,
        margin: const EdgeInsets.only(right: 10, bottom: 7),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: Colors.cyanAccent, width: 3),
          color: opaqueBoxes.elementAt(index).color,
        ),
      ),
    );
  }

// اسماء الالوان
  Widget _opaque(int index) {
    return Container(
      //  color: Colors.orangeAccent,
      margin: const EdgeInsets.only(right: 4, bottom: 2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color.fromARGB(0, 42, 80, 97),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        border: Border.all(
          color: Colors.black,
          width: 4,
        ),
      ),
      child: Text(
        opaqueBoxes.elementAt(index).name,
        style: const TextStyle(
            fontSize: 18, color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold,
            fontFamily: 'CabinSketch',),
      ),
    );
  }

  void playSFXBoxAccepted(bool accepted) async {
    try {
      await player.pause();
      accepted
          ? await player.setAsset('assets/sfx/excellent_applause.wav')
          : await player.setAsset('assets/sfx/lose_sound.wav');
      await player.play();
      // await player.setUrl("https://s3.amazonaws.com/404-file.mp3");
    } on PlayerException catch (e) {
      // iOS/macOS: maps to NSError.code
      // Android: maps to ExoPlayerException.type
      // Web: maps to MediaError.code
      // Linux/Windows: maps to PlayerErrorCode.index
      print('Error code: ${e.code}');
      // iOS/macOS: maps to NSError.localizedDescription
      // Android: maps to ExoPlaybackException.getMessage()
      // Web/Linux: a generic message
      // Windows: MediaPlayerError.message
      print('Error message: ${e.message}');
    } on PlayerInterruptedException catch (e) {
      // This call was interrupted since another audio source was loaded or the
      // player was stopped or disposed before this audio source could complete
      // loading.
      print('Connection aborted: ${e.message}');
    } catch (e) {
      // Fallback for all errors
      print(e);
    }
    //   Future.delayed(const Duration(milliseconds: 700), () async {
    //     await player.play();
    //   });
    // }
  }

  void calculateScore(bool win) {
    //عدد النقاط على   عدد البوكسات فى المستوى
    double pointPerScore = level.points /
        (Boxes().numberOfBoxes(
          level.id,
        ));
//if (!win  && score <= 1) {
    if (!win) {
      score = score - 1;
    } else {
      score = score + pointPerScore;
    }
    setState(() {});
  }

  void acceptBox(Box box) {
    for (int i = 0; i < choiceBoxes.length; i++) {
      Box b = choiceBoxes.elementAt(i);
      if (b.name == box.name) {
        setState(() {
          choiceBoxes.removeAt(i);
        });
      }
    }
  }

  bool isLevelEnd() {
    //level ends if no more choice or  timer has  ended
    // ينتهى المستوى بانتهاء الاختيارات  او انتهاء الوقت
    return choiceBoxes.isEmpty || !timer.isActive;
  }

//play Won?
  isWin() {
    //win only if score greater than or equal minWin
    return score >= minWin;
  }

  //game ended check if lost or won
  //للتوجيه الى شاشة التنهئة او شاشة  الخسارة
  void gameLevelEnded(win) {
    //has won
    // pop on the current Screen
    Navigator.of(context).pop();
    if (win) {
      _goToWinScreen();
    } else {
      _goToLoseScreen();
    }
    //if timer still counting  cancle it!
    timer.cancel();
  }

// Sends the result data to the win announcement page
  void _goToWinScreen() {
    Stats stats = Stats(
      level: removeTrailPoints(level.id),
      score: removeTrailPoints(score),
      points: removeTrailPoints(level.points),
      minWin: removeTrailPoints(minWin),
      duration: removeTrailPoints(level.duration),
      statuse: 'W I N !',
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WinScreen(
          stats: stats,
        ),
      ),
    );
  }

//screenShoot

  void _goToLoseScreen() {
    Stats stats = Stats(
      level: removeTrailPoints(level.id),
      score: removeTrailPoints(score),
      points: removeTrailPoints(level.points),
      minWin: removeTrailPoints(minWin),
      duration: removeTrailPoints(level.duration),
      statuse: 'L O S E ! ',
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LostScreen(
          stats: stats,
        ),
      ),
    );
  }
//
}
