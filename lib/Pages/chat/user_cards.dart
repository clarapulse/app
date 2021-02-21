import 'dart:convert';

import 'package:clarapulse/Pages/chat/user_card.dart';
import 'package:clarapulse/Pages/login/sign_in.dart';
import 'package:clarapulse/utils/globals.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserCardsWidget extends StatefulWidget {
  UserCardsWidget({Key key}) : super(key: key);

  @override
  UserCardsWidgetState createState() => UserCardsWidgetState();
}

Future<dynamic> fetchConnections() async {
  final response = await http.get(
      Uri.https('clarapulsse.loca.lt', 'connections'),
      headers: await getAuthToken());
  if (response.statusCode == 200) {
    dynamic post = jsonDecode(response.body).cast();
    print(post);
    return post;
  } else {
    throw Exception('Failed to load post');
  }
}

class UserCardsWidgetState extends State<UserCardsWidget> {
  Future<dynamic> _post;

  @override
  void initState() {
    super.initState();
    _post = fetchConnections();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _post,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            // Data fetched successfully, display your data here
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: snapshot.data
                    .map((userInfo) => UserCardWidget(userInfo))
                    .toList());
          } else if (snapshot.hasError) {
            // Data fetched successfully, display your data here
            return Center(child: Text('Something went wrong...'));
          }
          List<UserData> list = [
            UserData.fullProfile(
                "example@gmail.com",
                "John Doe",
                "https://lh5.googleusercontent.com/-gKe8qUDkXJc/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuclhbf3_xwxozpf8XweRZrtOC91oIA/s96-c/photo.jpg",
                "",
                "University of California San Diego",
                false),
            UserData.fullProfile(
                "example@gmail.com",
                "Jane Doe",
                "https://lh5.googleusercontent.com/-gKe8qUDkXJc/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuclhbf3_xwxozpf8XweRZrtOC91oIA/s96-c/photo.jpg",
                "Santa Barbara High School",
                "",
                true)
          ];
          return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:
                  list.map((userInfo) => UserCardWidget(userInfo)).toList());
        });
  }
}
