

import 'package:clarapulse/Pages/IntendedMajorScreen/setup_form.dart';
import 'package:flutter/material.dart';



class IntendedMajorScreen extends StatelessWidget {
  IntendedMajorScreen(this.highSchool);
  String highSchool;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Set_Up_Form(highSchool),
    );
  }
}
