import 'package:e_learning_app/puzzle_lib/src/inject_dependencies.dart';
import 'package:e_learning_app/puzzle_lib/src/my_app.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import '../../constants.dart';

class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.dashboard_rounded,
              color: kblue,
            ),),
        IconButton(
            onPressed: () async{
               setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();
              // ignore: use_build_context_synchronously
              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const MyPuzzle(),),);
                                
            },
            icon: const Icon(
              Icons.search_rounded,
            ),)
      ],
    );
  }
}
