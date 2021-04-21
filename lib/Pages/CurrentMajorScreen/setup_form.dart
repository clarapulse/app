import 'package:clarapulse/Components/background.dart';
import 'package:clarapulse/Components/rounded_button.dart';
import 'package:clarapulse/Components/rounded_input_field.dart';
import 'package:clarapulse/Pages/login/sign_in.dart';
import 'package:clarapulse/Pages/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class Set_Up_Form extends StatelessWidget {
  Set_Up_Form(this.university);
  String university;
  String major;
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
              hintText: "Enter Your Current Major",
              onChanged: (value) {
                major = value;
              },
            ),
            RoundedButton(
              text: "SUBMIT",
              press: () async {
                http.post(Uri.https('clarapulsse.loca.lt', 'university'),
                    headers: await getAuthToken(),
                    body: {'university_name': university, 'major': major});
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return HomeScreenWidget();
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
