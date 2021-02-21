import 'package:clarapulse/Pages/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Pages/login/login_page.dart';
import 'utils/globals.dart';

void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  Widget home = LoginPage();
  if (prefs.getString('userName') != null ){
    localUser = LocalUser(prefs.getString('userEmail'), prefs.getString('userName'), prefs.getString('userPicture'));
    home = HomeScreenWidget();
  }
  
  runApp(MyApp(home));
}

class MyApp extends StatelessWidget {
  MyApp(this.home);
  final Widget home;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: home,
    );
  }
}