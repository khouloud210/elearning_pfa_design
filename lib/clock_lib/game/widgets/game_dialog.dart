import 'package:e_learning_app/math_lib/utils/colorConst.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GameDialog extends StatelessWidget {
  const GameDialog({
    Key? key,
    required this.title,
    required this.animation,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final String animation;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Column(
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(
              color: baseColorLight,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Center(
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
          Lottie.asset(
            'assets/animations/$animation',
            height: 190,
            width: 190,
          ),
          ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(baseColor),
     // Set the button color
                 ),
            child: Text(
              buttonText,
              
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
        ],
      ),
    );
  }
}
