import 'package:e_learning_app/clock_lib/score/score.dart';
import 'package:e_learning_app/clock_lib/settings/settings.dart';
import 'package:e_learning_app/clock_lib/storage/storage_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_lib/main.dart';


void main() {
  runApp(
    RepositoryProvider(
      create: (context) => StorageSharedPreferences(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ScoreCubit(
              context.read<StorageSharedPreferences>(),
            ),
          ),
          BlocProvider(
            create: (context) => SettingsCubit(
              context.read<StorageSharedPreferences>(),
            ),
            lazy: false,
          ),
        ],
       child: const MyApp(),
       
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //removing debug banner
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData( primarySwatch: Colors.red,),
      home:  LoginApp()
      //home: const WelcomeScreen(),
      
    );
  }
}
