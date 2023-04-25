
// ignore_for_file: file_names

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:e_learning_app/math_lib/utils/colorConst.dart';
import 'package:flutter/material.dart';

import 'package:e_learning_app/screens/home_screen.dart';
import 'AskOperator.dart';
import 'customWidget/DisplayButton.dart';
int _selectedIndex = 0;

class HomeScreen extends StatefulWidget {
  
  const HomeScreen({Key? key}) : super(key: key);

  @override
    State<HomeScreen> createState() => _HomeScreenstate();
}

class _HomeScreenstate extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

       leading: BackButton(
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
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 10, 30, 10),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(parent: ScrollPhysics()),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: Image.asset('assets/math.jpg'),),
                const SizedBox(
                  height: 15,
                ),
                DisplayButton(
                  text: 'Generate PDF',
                  
                  function: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AskOperator(isQuiz: false),
                    ),
                  ),
                ),
                SizedBox(
                  height: (MediaQuery.of(context).size.height * 15) / 816,
                ),
                DisplayButton(
                  text: 'Quiz',
                  function: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AskOperator(isQuiz: true),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}

