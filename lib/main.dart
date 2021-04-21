import 'package:clarapulse/Pages/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Pages/login/login_page.dart';
import 'Pages/login/sign_in.dart';
import 'utils/fcm.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Widget home = LoginPage();
  signOutGoogle(); // for demo
  if (FirebaseAuth.instance.currentUser != null) {
    // home = HomeScreenWidget();
  }
  final FirebaseMessaging _fcm = FirebaseMessaging();
  await setupFCM();
  var x = await _fcm.getToken();
  print(x);
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
      debugShowCheckedModeBanner: false,
    );
  }
}
