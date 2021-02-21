import 'dart:convert';

import 'package:clarapulse/Pages/SetupHighschoolQuestion/setup_highschool_page.dart';
import 'package:clarapulse/utils/globals.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../main_screen.dart';
import 'sign_in.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(size: 150),
              SizedBox(height: 50),
              _signInButton(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _updateUserState(User user) async {
    // final SharedPreferences prefs = await _prefs;
    // await prefs.setString("userEmail", user.email);
    // await prefs.setString("userPicture", user.photoURL);
    // await prefs.setString("userEmail", user.displayName);
    // await prefs.setString("userToken", await user.getIdToken());
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () async {
        User user = await signInWithGoogle();
        String idToken = await user.getIdToken();
        http.post(
          Uri.https('backend-6h662eujpa-wl.a.run.app', 'adduser'),
          headers: <String, String>{'Authorization': idToken},
        );
        await _updateUserState(user);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return SetUpHighSchoolScreen();
            },
          ),
        );
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
