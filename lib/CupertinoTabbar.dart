import 'package:flutter/cupertino.dart';
import 'package:intro_screen/View/HomeScreen.dart';
import 'package:intro_screen/View/SecondScreen.dart';
import 'package:intro_screen/View/SettingPage.dart';

class CupertinoTabbar extends StatefulWidget {
  const CupertinoTabbar({super.key});

  @override
  State<CupertinoTabbar> createState() => _CupertinoTabbarState();
}

class _CupertinoTabbarState extends State<CupertinoTabbar> {
  int _currentIndex = 0;
  final _pageWidgets = [
    TableCalendarEventSelection(),
    SecondScreen(),
    SettingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.star_fill),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.clock_solid),
            label: 'Recents',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_alt_circle_fill),
            label: 'Contacts',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return Center(
              child: Text('Content of tab $index'),
            );
          },
        );
      },
    );
  }
}
