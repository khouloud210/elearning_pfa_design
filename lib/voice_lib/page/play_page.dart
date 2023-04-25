// ignore_for_file: always_declare_return_types, prefer_final_locals, null_check_always_fails

import 'dart:async';
import 'dart:math';

import 'package:e_learning_app/constants.dart';
import 'package:e_learning_app/screens/home_screen.dart';
import 'package:e_learning_app/voice_lib/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speech/flutter_speech.dart';

import '../../math_lib/utils/colorConst.dart';
import '../widget/drawer_menu.dart';

class PlayPage extends StatefulWidget {
  const PlayPage({Key? key, required this.title, required this.level}) : super(key: key);

  final String title;
  final String level;

 
  @override
  State<StatefulWidget> createState() => _PlayPage();
}

const String basic = 'basic';
const String advanced = 'advanced';

const List<String> baseThemeList = [
  'egg',
  'door',
  'bus',
  'chickens',
  'blue',
  'red',
  'women',
  'passenger'
];

const List<String> advancedThemeList = [
  "It's Andromeda",
   'I bought a ',
   'batter-',
   'Monopoly and',
   'Visiting the ',
   'Author in surgery',
   'Snowplow ',
   'Cargo Passe',
   'Osteoporosis lawsuit won'
];

const languages = [
  Language('English', 'en_AS'),
];

class Language {
  final String name;
  final String code;

  const Language(this.name, this.code);
}

class _PlayPage extends State<PlayPage> with SingleTickerProviderStateMixin {

  late SpeechRecognition _speech;
  bool _speechRecognitionAvailable = false;
  bool _isListening = false;
  int _hp = 5;

  String _themeText = '';
  String transcription = '';

  String _image = '';

  Language selectedLang = languages.first;

  @override
  initState() {
    super.initState();
    activateSpeechRecognizer();
    setTongueTwister(widget.level);
    if (widget.level == basic) {
      _image = 'assets/images/godzila.gif';
      _hp = 5;
    }
    if (widget.level == advanced) {
      _image = 'assets/images/kong2.gif';
      _hp = 7;
    }
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  void activateSpeechRecognizer() {
   // print('_MyAppState.activateSpeechRecognizer... ');
    _speech = SpeechRecognition();
    _speech.setAvailabilityHandler(onSpeechAvailability);
    _speech.setRecognitionStartedHandler(onRecognitionStarted);
    _speech.setRecognitionResultHandler(onRecognitionResult);
    _speech.setRecognitionCompleteHandler(onRecognitionComplete);
    _speech.setErrorHandler(errorHandler);
    _speech.activate('ja_JA').then((res) {
      setState(() => _speechRecognitionAvailable = res);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: baseColorLight,
         leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          size: 25,
          color: Colors.white,
        ),
           onPressed: () {
                                  //home screen path
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const MyHomePage(title: '',),),);
                                },
        
       

      ),
        title: Text(widget.title),
        centerTitle: true,
      ),
     
      body: Column(
        
        children: <Widget>[
          
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            // ignore: avoid_redundant_argument_values
            mainAxisSize: MainAxisSize.max,
            
            children: <Widget>[
              const Icon(Icons.favorite,size: 40,
              color: kpink,)
              ,
              // ignore: prefer_interpolation_to_compose_strings
              Text(' ' + _hp.toString() +'  ',
                  style: const TextStyle(fontSize: 30,
                  fontWeight: FontWeight.bold, color: kpink2),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                InkWell(
                  onTap: () => _themeText != 'End !!'? setTongueTwister(widget.level) : null,
                  child: Container(
                    child: _themeText != 'End !!'? const Icon(Icons.autorenew ,size: 40,) : null,
                  ),
                ),

              Container(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    _themeText,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ],
          ),
          
          // ignore: sized_box_for_whitespace
          Container(
            height: 350,
            child: Center(
              child: Image.asset(_image),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            width: 500,
            height: 30,
            color: Colors.grey.shade200,
            child: Text(transcription),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              
              children: <Widget>[

                _buildButton(
                  onPressed: _speechRecognitionAvailable && !_isListening? () => start()
                      : null,

                  label: _isListening?   'Listening...' : 'Start chanting',

                ),
                _buildButton(
                  onPressed: _isListening ? () => clear() : null,
                  label: 'Redo',
                  
                ),
                _buildButton(
                  onPressed: () {
                    attack();
                  },
                  label: 'Attack',
                ),
              ],)
        ],
      ),
      
    );
  }

  Widget _buildButton({required String label, required VoidCallback ? onPressed}) => 
  
  
  Padding(
      padding: const EdgeInsets.all(35.0),
      
      child: ElevatedButton(
            style: ElevatedButton.styleFrom(
    backgroundColor: baseColor,
     // background
    
   
  ),
    
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold),
        ),
      ),);

  void start() => _speech.activate(selectedLang.code).then((_) {
        return _speech.listen().then((result) {
          //print('_MyAppState.start => result $result');
          setState(() {
            _isListening = result;
          });
        });
      });

  void cancel() =>
      _speech.cancel().then((_) => setState(() => _isListening = false));

  void stop() => _speech.stop().then((_) {
        setState(() => _isListening = false);
      });

  void clear() {
    cancel();
    setState(() => transcription = '');
  }

  Future<void> attack() async {
    if (_isListening) {
      stop();
      await Future.delayed(const Duration(milliseconds: 500));
    }
    if (_themeText == transcription) {
      setState(() => _hp = _hp - 1);
      setTongueTwister(widget.level);
    }
    if (_hp <= 0) {
      setState(() => _image = 'assets/images/winner.gif');
      setState(() => _themeText = 'Good Job !' ,);
    }
  }

  void onSpeechAvailability(bool result) =>
      setState(() => _speechRecognitionAvailable = result);

  void onCurrentLocale(String locale) {
    //print('_MyAppState.onCurrentLocale... $locale');
    setState(
        () => selectedLang = languages.firstWhere((l) => l.code == locale),);
  }

  void onRecognitionStarted() {
    setState(() => _isListening = true);
  }

  void onRecognitionResult(String text) {
    //print('_MyAppState.onRecognitionResult... $text');
    setState(() => transcription = text);
  }

  void onRecognitionComplete(String text) {
    //print('_MyAppState.onRecognitionComplete... $text');
    setState(() => _isListening = false);
  }

  void errorHandler() => activateSpeechRecognizer();

  void setTongueTwister(String level) {
    if (level == basic) {
      int index = Random().nextInt(baseThemeList.length);
      setState(() => _themeText = baseThemeList[index]);
    }
    if (level == advanced) {
      int index = Random().nextInt(advancedThemeList.length);
      setState(() => _themeText = advancedThemeList[index]);
    }
   
    if(level != basic && level != advanced) {
      int index = Random().nextInt(baseThemeList.length);
      setState(() => _themeText = baseThemeList[index]);
    }
  }
}
