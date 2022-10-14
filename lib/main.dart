import 'package:flutter/material.dart';
import 'package:intro_screen/CupertinoTabbar.dart';
import 'package:intro_screen/View/HomeScreen.dart';
import 'package:intro_screen/View/SecondScreen.dart';
import 'package:intro_screen/background.dart';
import 'package:intro_screen/bottomtabpage.dart';
import 'package:intro_screen/introScreen.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  //runApp(const MyApp());
  initializeDateFormatting('ja').then((_) => runApp(MyApp())); //上の記述をこちらに変更します
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        "/": (context) => IntroScreen(),
        "home": (context) => BottomTabPage(),
      },
    );
  }
}
