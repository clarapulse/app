import 'package:clarapulse/Components/background.dart';
import 'package:clarapulse/Components/rounded_button.dart';
import 'package:clarapulse/Components/rounded_input_field.dart';
import 'package:clarapulse/Pages/HighSchoolScreen/high_school_screen.dart';
import 'package:clarapulse/Pages/UniversityScreen/university_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SET UP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/signup.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              "ARE YOU A HIGH SCHOOL STUDENT?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.02),
            RoundedButton(
              text: "YES",
              press: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return HighSchoolScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "NO",
              press: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return UniversityScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}
