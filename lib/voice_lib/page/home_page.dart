// ignore_for_file: library_private_types_in_public_api

import 'package:e_learning_app/math_lib/utils/colorConst.dart';
import 'package:e_learning_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../ui/home_panel.dart';
import '../widget/drawer_menu.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
int _selectedIndex = 0;
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         
          title: Text(widget.title),
        centerTitle: true,
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
                                          builder: (context) => const HomeScreen(),),);
                                },
        
       

      ),
      
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
      
      body: const Center(
        child: HomePanel(),

      ),
    );
  }
}
