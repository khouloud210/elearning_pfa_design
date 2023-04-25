// ignore_for_file: use_decorated_box, use_key_in_widget_constructors

import 'package:e_learning_app/kid_lib/screens/alphabets.dart';
import 'package:e_learning_app/kid_lib/screens/colors.dart';
import 'package:e_learning_app/kid_lib/screens/counting.dart';
import 'package:e_learning_app/kid_lib/screens/shapes.dart';
import 'package:e_learning_app/kid_lib/screens/stories.dart';
import 'package:e_learning_app/kid_lib/widgets/category_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Widget> _categories = [
    const CategoryCard(
      title: 'Colors',
      primaryColor: Colors.orangeAccent,
      secondaryColor: Colors.orange,
      screen: ColorsScreen(
        title: 'Colors',
        primaryColor: Colors.orangeAccent,
        secondaryColor: Colors.orange,
      ),
    ),
    const CategoryCard(
      title: '123',
      primaryColor: Colors.greenAccent,
      secondaryColor: Colors.green,
      screen: CountingScreen(
        title: '123',
        primaryColor: Colors.greenAccent,
        secondaryColor: Colors.green,
      ),
    ),
    const CategoryCard(
      title: 'ABC',
      primaryColor: Colors.purpleAccent,
      secondaryColor: Colors.purple,
      screen: AlphabetsScreen(
        title: 'ABC',
        primaryColor: Colors.purpleAccent,
        secondaryColor: Colors.purple,
      ),
    ),
    const CategoryCard(
      title: 'Stories',
      primaryColor: Color(0xFF3383CD),
      secondaryColor: Color(0xFF11249F),
      screen: StoriesScreen(
        title: 'Stories',
        primaryColor: Color(0xFF3383CD),
        secondaryColor: Color(0xFF11249F),
      ),
    ),
    const CategoryCard(
      title: 'Shapes',
      primaryColor: Colors.redAccent,
      secondaryColor: Colors.red,
      screen: ShapesScreen(
        title: 'Shapes',
        primaryColor: Colors.redAccent,
        secondaryColor: Colors.red,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[50],
          image: const DecorationImage(
            image: AssetImage('assets/images/bg-bottom.png'),
            alignment: Alignment.bottomCenter,
          ),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 188.0,
              backgroundColor: Colors.grey[50],
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/bg-top.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(_categories),
            ),
          ],
        ),
      ),
    );
  }
}
