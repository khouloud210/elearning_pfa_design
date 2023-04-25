import 'package:e_learning_app/login_lib/routes.dart';
import 'package:e_learning_app/login_lib/theme.dart';
import 'package:flutter/material.dart';

import 'screens/loading.dart';



class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      routes: routes,
      debugShowCheckedModeBanner: false,
      home: Loading(),
    );
  }
}
