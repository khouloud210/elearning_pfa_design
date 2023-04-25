import 'package:flutter/material.dart';
import 'package:e_learning_app/login_lib/components/coustom_bottom_nav_bar.dart';
import 'package:e_learning_app/login_lib/enums.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
