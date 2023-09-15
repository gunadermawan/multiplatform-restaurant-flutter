import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/ui/restaurant_list.dart';
import 'package:restaurant/ui/settings.dart';
import 'package:restaurant/widget/platform_widget.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';

  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _bottomNavIndex = 0;
  static const String _headlineText = 'Headline';

  final List<Widget> _listWidget = const [RestaurantListPage(), SettingsPage()];

  final List<BottomNavigationBarItem> _bottomNavIndexItems = [
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.news : Icons.newspaper),
      label: _headlineText,
    ),
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.settings : Icons.settings),
      label: SettingsPage.settingsTitle,
    ),
  ];

  void _onBottomNavigationTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  Widget _buildAndroid(BuildContext buildContext) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.grey,
        currentIndex: _bottomNavIndex,
        onTap: _onBottomNavigationTapped,
        items: _bottomNavIndexItems,
      ),
    );
  }

  Widget _buildIos(BuildContext buildContext) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: _bottomNavIndexItems,
          activeColor: Colors.white10,
        ),
        tabBuilder: (context, index) {
          return _listWidget[index];
        });
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(androidBuilder: _buildAndroid, iosBuilder: _buildIos);
  }
}
