import 'package:e_learning_app/math_lib/utils/colorConst.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../game.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => GameRandomNumbers(),
      child: BlocProvider<GameCubit>(
        create: (context) => GameCubit(
          context.read<GameRandomNumbers>(),
        ),
        child: const GameView(),
      ),
    );
  }
}

class GameView extends StatelessWidget {
  const GameView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final gameCubit = context.read<GameCubit>();

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            alignment: Alignment.center,
            height: 600,
            width: 1024,
            child: Column(
              children: [
                Flexible(
                  child: Stack(
                    children: [
                      Container(
                        constraints: const BoxConstraints.expand(),
                       
                        child: const Image(
                          
                          image: AssetImage(
                            
                            'assets/images/whattime-01.png',
                            
                          ),
                      
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           GameBackButton(
                                iconColor: baseColorLight,
                                icon: Icons.arrow_back_rounded,
                                
                                onTap: () {
                                  Navigator.popUntil(
                                    context,
                                    (route) => route.isFirst,
                                  );
                                  gameCubit.gameOver();
                                },
                              ),
                          Row(
                           
                            children: [
                              HealthWidget(),
                               const ScoreWidget(),
                            ],
                          ),
                         
                         
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 150,right: 55
                        ),
                        child: DigitalClockWidget(),
                      ),
                    ],
                  ),
                ),
                const AnalogClocksWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
