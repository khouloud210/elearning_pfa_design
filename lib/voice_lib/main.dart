import 'package:flutter/material.dart';
import 'page/home_page.dart';
import 'page/play_page.dart';

void main() => runApp(const Myvoice());

class Myvoice extends StatelessWidget {
  const Myvoice({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const String title = 'SPELL BOOK';
    return MaterialApp(
      title: title,
      theme: ThemeData(
       
        primaryColor: Colors.blueGrey[600], colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blueGrey[600]),
      ),
      home: MyHomePage(title: title),
      routes: <String,WidgetBuilder>{
        '/home': (BuildContext context) => MyHomePage(title: title),
        '/play/basic': (BuildContext context) => PlayPage(title: title, level: 'basic'),
        '/play/advanced': (BuildContext context) => PlayPage(title: title, level: 'advanced'),
      },
    );
  }
}