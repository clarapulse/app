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
    List<dynamic> post = jsonDecode(response.body);

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
            if (snapshot.data.isEmpty) {
              return Center(child: Text('You have no active chats'));
            }
            return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: snapshot.data
                    .map((userInfo) => UserCardWidget(userInfo))
                    .toList()
                    .cast<Widget>());
          } else if (snapshot.hasError) {
            // Data fetched successfully, display your data here
            return Center(child: Text('Something went wrong...'));
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
