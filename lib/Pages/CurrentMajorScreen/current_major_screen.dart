
import 'package:clarapulse/Pages/CurrentMajorScreen/setup_form.dart';
import 'package:flutter/material.dart';



class CurrentMajorScreen extends StatelessWidget {
  CurrentMajorScreen(this.university);
  String university;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Set_Up_Form(university),
    );
  }
}
