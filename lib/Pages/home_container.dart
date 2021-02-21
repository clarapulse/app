import 'package:clarapulse/Pages/chat/user_cards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login/login_page.dart';
import 'login/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:clarapulse/utils/globals.dart';
import 'package:clarapulse/Pages/connect/container.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomeScreenWidget extends StatefulWidget {
  HomeScreenWidget({Key key}) : super(key: key);

  @override
  HomeScreenWidgetState createState() => HomeScreenWidgetState();
}
class HomeScreenWidgetState extends  State<HomeScreenWidget> {
  static const String _title = 'ClaraPulse';
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Profile',
      style: optionStyle,
    ),
    ConnectContainer(),
    UserCardWidget(),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue[50], Colors.blue[100]],
          ),
        ),
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.plus_square_fill),
            label: 'Connect',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.videocam_fill),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.gear_alt_fill),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: CupertinoColors.black,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        unselectedItemColor: CupertinoColors.inactiveGray,
      ),
    );
  }
}