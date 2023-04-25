// ignore_for_file: file_names

//import 'package:e_learning_app/screens/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../HomeScreen.dart';
import '../utils/colorConst.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          size: 25,
          color: Colors.white,
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,

         onPressed: () {
                                  //home screen path
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const HomeScreen(),),);
                                },
        
    
      ),
      centerTitle: true,
      title: const Text(
        'Mathematics ',
        textAlign: TextAlign.center,
        
        style: TextStyle(
            color: Colors.white,
            
            fontSize: 30,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,),
      ),
      backgroundColor: baseColorLight,
      elevation: 0,
    );
  }
}
