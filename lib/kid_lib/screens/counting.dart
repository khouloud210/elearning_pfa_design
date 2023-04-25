import 'dart:async' show Future;
import 'dart:convert';
import 'package:e_learning_app/kid_lib/entities/number.dart';
import 'package:e_learning_app/kid_lib/helper.dart';
import 'package:e_learning_app/kid_lib/widgets/page_header.dart';
import 'package:e_learning_app/kid_lib/widgets/tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:text_to_speech/text_to_speech.dart';

Future<List<NumberEntity>> _fetchNumbers() async {
  // ignore: prefer_final_locals
  String jsonString = await rootBundle.loadString('assets/data/numbers.json');
  final jsonParsed = json.decode(jsonString);

  return jsonParsed
      .map<NumberEntity>((json) => NumberEntity.fromJson(json))
      .toList();
}

class CountingScreen extends StatefulWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  const CountingScreen({Key? key, 
    required this.title,
    required this.primaryColor,
    required this.secondaryColor,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CountingScreenState createState() => _CountingScreenState();
}

class _CountingScreenState extends State<CountingScreen> {
  late Future<List<NumberEntity>> _numbersFuture;
  late int _selectedIndex =0;
  TextToSpeech tts = TextToSpeech();
  @override
  void initState() {
    super.initState();
    _numbersFuture = _fetchNumbers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          PageHeader(
            title: widget.title,
            primaryColor: widget.primaryColor,
            secondaryColor: widget.secondaryColor,
          ),
          Expanded(
            child: FutureBuilder(
              future: _numbersFuture,
              builder: (context,AsyncSnapshot<List>  snapshot) {
                if (snapshot.hasData) {
                  return MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.0,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: index % 2 == 0
                              ? const EdgeInsets.only(bottom: 20, left: 20)
                              : const EdgeInsets.only(bottom: 20, right: 20),
                          child: TileCard(
                            isActive: _selectedIndex == index,
                            title: snapshot.data![index].text,
                            textColor: getIndexColor(index),
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                              tts.speak(snapshot.data![index].number);
                            },
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('Loading...'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
