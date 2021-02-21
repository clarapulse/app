import 'package:clarapulse/Components/rounded_button.dart';
import 'package:clarapulse/Components/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'background.dart';

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
            RoundedInputField(
              hintText: "Your High School",
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "NEXT",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}
