// ignore_for_file: file_names, noop_primitive_operations

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../HomeScreen.dart';
import '../customWidget/customWidgetMethods.dart';
import '../utils/colorConst.dart';
import 'UserAnswerScreen.dart';
final AudioPlayer player = AudioPlayer();
class AnswerScreen extends StatelessWidget {
  
  const AnswerScreen({Key? key, 
   
    required this.score,
    required this.maxScore,
    required this.questions,
    required this.answers,
    required this.userAnswer,
  }) : super(key: key);
  final int score;
  final int maxScore;
  final List<dynamic> questions;
  final List<dynamic> answers;
  final List<dynamic> userAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: const CustomAppBar(),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (score * 100 / maxScore > 75 == true)
              Image.asset('assets/images/congrats.gif')
            else if (score * 100 / maxScore > 40 == true)
              Image.asset('assets/images/clap.gif')
            else
              Padding(
                // ignore: use_named_constants
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Image.asset(
                  'assets/images/lose.png',
                  width: 300,
                ),
                
              ),
            const SizedBox(
              height: 30,
              
            ),
            const Text('YOUR SCORE IS ',
            
                style: TextStyle(
                  fontSize: 40,
                  color: baseColor,
                  fontWeight: FontWeight.bold
                  
                ),),
            const SizedBox(
              height: 30,
            ),
            Text('${score.toString()} /  ${maxScore.toString()}',
                style: const TextStyle(
                  fontSize: 25,
                  color: baseColorLight,
                  fontWeight: FontWeight.bold
                ),),
            const SizedBox(
              height: 45,
            ),
            MaterialButton(
              onPressed: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),),
                  
              child: const Text('Go To Home ',
              
                  style: TextStyle(color: baseColor,fontSize: 20),),
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserAnswerScreen(
                          answers: answers,
                          questions: questions,
                          userAnswer: userAnswer,),),),
                           padding: const EdgeInsets.fromLTRB(0, 0, 13, 0),
              child: const Text('Check Your Answer',
                  style: TextStyle(color: kpink,fontSize: 25,fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}
