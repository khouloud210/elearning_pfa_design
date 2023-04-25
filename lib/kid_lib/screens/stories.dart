import 'package:e_learning_app/kid_lib/constant.dart';
import 'package:e_learning_app/kid_lib/widgets/page_header.dart';
import 'package:flutter/material.dart';

class StoriesScreen extends StatelessWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  const StoriesScreen({Key? key, 
    required this.title,
    required this.primaryColor,
    required this.secondaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          PageHeader(
            title: title,
            primaryColor: primaryColor,
            secondaryColor: secondaryColor,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Comming soon...',
              style: kSubTextStyle.copyWith(
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
