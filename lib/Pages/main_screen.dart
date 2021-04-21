import 'package:clarapulse/Pages/chat/user_cards.dart';
import 'package:clarapulse/Pages/connect/connect_container.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login/login_page.dart';
import 'login/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:clarapulse/utils/globals.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import './profile/profilewidget.dart';

class HomeScreenWidget extends StatefulWidget {
  HomeScreenWidget({Key key}) : super(key: key);

  @override
  HomeScreenWidgetState createState() => HomeScreenWidgetState();
}

class HomeScreenWidgetState extends State<HomeScreenWidget> {
  User user = FirebaseAuth.instance.currentUser;

  static const String _title = 'ClaraPulse';
  final FirebaseMessaging _fcm = FirebaseMessaging();
  int _selectedIndex = 2;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm new connection'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Would you like to connect with Eddie?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _fcm.configure(onMessage: (Map<String, dynamic> message) async {
      print("onMessage: $message");
      await _showMyDialog();
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      ProfileWidget(user),
      ConnectContainerWidget(),
      UserCardsWidget(),
      Text(
        'Index 2: Settings',
        style: optionStyle,
      ),
    ];

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
