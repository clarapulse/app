import 'package:clarapulse/Components/background.dart';
import 'package:clarapulse/Components/rounded_button.dart';
import 'package:clarapulse/Components/rounded_input_field.dart';
import 'package:clarapulse/Pages/IntendedMajorScreen/intended_major_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class Set_Up_Form extends StatelessWidget {
  String highSchool;
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
            RoundedInputField(
              hintText: "Enter Your High School",
              onChanged: (value) {
                highSchool = value;
              },
            ),
            RoundedButton(
              text: "NEXT",
              press: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return IntendedMajorScreen(highSchool);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}