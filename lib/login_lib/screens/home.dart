
import 'package:e_learning_app/login_lib/screens/profile.dart';
import 'package:e_learning_app/login_lib/screens/sign_in/sign_in_screen.dart';
import 'package:e_learning_app/login_lib/services/user_service.dart';
import 'package:e_learning_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog App'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              logout().then((value) =>
                  {Navigator.pushNamed(context, SignInScreen.routeName)});
            },
          )
        ],
      ),
      body: currentIndex == 0 ? const HomeScreen() : Profile(),
      
      );
      
  }
}
