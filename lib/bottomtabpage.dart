import 'package:flutter/material.dart';
import 'package:intro_screen/View/DataScreen.dart';
import 'package:intro_screen/View/HomeScreen.dart';
import 'package:intro_screen/View/SecondScreen.dart';
import 'package:intro_screen/View/SettingPage.dart';

class BottomTabPage extends StatefulWidget {
  const BottomTabPage({super.key});

  @override
  State<BottomTabPage> createState() => _BottomTabPageState();
}

class _BottomTabPageState extends State<BottomTabPage> {
  int _currentIndex = 0;
  final _pageWidgets = [
    TableCalendarEventSelection(),
    SecondScreen(),
    SettingPage(),
    DataScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageWidgets.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(Icons.house_outlined),
              label: "ホーム"),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_walk_outlined),
              activeIcon: Icon(Icons.directions_run),
              label: "アクティビティ"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              activeIcon: Icon(Icons.settings_suggest_outlined),
              label: '設定'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_outlined),
              activeIcon: Icon(Icons.equalizer_outlined),
              label: 'データ'),
        ],
        currentIndex: _currentIndex,
        fixedColor: Color.fromARGB(255, 1, 39, 253),
        backgroundColor: Color.fromARGB(255, 222, 222, 222),
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _onItemTapped(int index) => setState(() => _currentIndex = index);
}
