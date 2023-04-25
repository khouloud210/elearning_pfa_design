import 'package:e_learning_app/constants.dart';
import 'package:e_learning_app/math_lib/utils/colorConst.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../l10n/l10n.dart';
import '../score.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<ScoreCubit, ScoreState>(
      builder: (context, state) {
        if (state is ScoreInitial) {
          return const CircularProgressIndicator();
        } else if (state is ScoreLoaded) {
          final scoreState = state.score;
          return ScoreLoadWidget(
            l10n: l10n,
            scoreState: scoreState,
          );
        } else {
          return Center(
            child: Text(l10n.appErrorText),
          );
        }
      },
    );
  }
}

class ScoreLoadWidget extends StatelessWidget {
  const ScoreLoadWidget({
    Key? key,
    required this.l10n,
    required this.scoreState,
  }) : super(key: key);

  final AppLocalizations l10n;
  final Score scoreState;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: 600,
        width: 1024,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: baseColorLight,
            title: Text(l10n.scorePageTitle),
            centerTitle: true,
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                l10n.scorePageTitle,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: baseColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                // -If there is no score record, it shows 'no data'.
                scoreState.dateTime == 'No Score'
                    ? l10n.scorePageNoData
                    : scoreState.dateTime!,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: baseColorLight,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                    scoreState.score.toString(),
                    style: const TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: kpink,
                    ),
                  ),
                  const Icon(
                    Icons.star_sharp,
                    color: korange2,
                    size: 70.0,
                  ),
                 
                ],
              ),
              ClearButtonWidget(l10n: l10n),
            ],
          ),
        ),
      ),
    );
  }
}

class ClearButtonWidget extends StatelessWidget {
  const ClearButtonWidget({
    Key? key,
    required this.l10n,
  }) : super(key: key);

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(baseColor),
     // Set the button color
                 ),
      onPressed: () {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return SimpleDialog(
              contentPadding: const EdgeInsets.all(10),
              children: <Widget>[
                DecoratedBox(
                  decoration: const BoxDecoration(
                    color: baseColor,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Center(
                    child: Text(
                      l10n.dialogAreYouSure,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    l10n.dialogClearScoreAttentionText,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      
                       style: ElevatedButton.styleFrom(backgroundColor: baseColor),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        l10n.dialogCancelButton,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: kpink),
                      onPressed: () {
                        context.read<ScoreCubit>().clearScore();
                        Navigator.pop(context);
                      },
                      child: Text(
                        l10n.dialogClearButton,
                        style: Theme.of(context).textTheme.labelLarge,
                        
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            );
          },
        );
      },
      child: Text(l10n.dialogClearButton),
    );
  }
}
