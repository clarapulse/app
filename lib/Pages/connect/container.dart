import 'dart:convert';

import 'package:clarapulse/utils/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConnectContainer extends StatefulWidget {
  ConnectContainer({Key key}) : super(key: key);

  @override
  ConnectContainerState createState() => ConnectContainerState();
}

class ConnectContainerState extends State<ConnectContainer> {
  Future<List<dynamic>> fetchConnections() async {
    final response =
        await http.get(Uri.https('clarapulse.loca.lt', 'connections'));
    if (response.statusCode == 200) {
      List<dynamic> post = jsonDecode(response.body);
      return post;
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  void initState() {
    super.initState();
    // fetchConnections();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ListTile(
                leading: ClipOval(
                    child: Image.network(
                  localUser.photoURL,
                  fit: BoxFit.cover,
                  width: 60.0,
                  height: 60.0,
                )),
                title: Text('Little Timmy'),
                subtitle: Text('University of California Santa Barbara'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
