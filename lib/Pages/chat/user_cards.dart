import 'dart:convert';

import 'package:clarapulse/Pages/login/sign_in.dart';
import 'package:clarapulse/utils/globals.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserCardWidget extends StatefulWidget {
  UserCardWidget({Key key}) : super(key: key);

  @override
  UserCardWidgetState createState() => UserCardWidgetState();
}

Future<dynamic> fetchConnections() async {
    final response = await http.post(Uri.https('clarapulse.loca.lt', 'connections'),
          headers: await getAuthToken(),
          body:{
            'who': 'red'
          });
    if (response.statusCode == 200) {
      dynamic post = jsonDecode(response.body).cast();
      return post;
    } else {
      throw Exception('Failed to load post');
  }
  }

class UserCardWidgetState extends  State<UserCardWidget>{
  Future<List<UserData>> _post;

  @override
  void initState() {
    super.initState();
    // fetchConnections();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _post,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          // Data fetched successfully, display your data here
          List<UserData> list = [UserData.fullProfile("example@gmail.com", "John Doe", "https://lh5.googleusercontent.com/-gKe8qUDkXJc/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuclhbf3_xwxozpf8XweRZrtOC91oIA/s96-c/photo.jpg", "", "University of California San Diego", false),
      UserData.fullProfile("example@gmail.com", "Jane Doe", "https://lh5.googleusercontent.com/-gKe8qUDkXJc/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuclhbf3_xwxozpf8XweRZrtOC91oIA/s96-c/photo.jpg", "Santa Barbara High School", "", true)];
          print(list);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: list.map((userInfo) => 
                new Center(
                  child:Container(
                    height: 100,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          ListTile(
                            leading: ClipOval(
                              child: Image.network(
                                userInfo.photoURL,
                                fit: BoxFit.cover,
                                width: 60.0,
                                height: 60.0,
                              )
                            ),
                            title: Text(userInfo.name),
                            subtitle: Text(userInfo.inHighSchool ? userInfo.highSchool : userInfo.university),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ).toList()
            );
          } else if (snapshot.hasError) {
            // Data fetched successfully, display your data here
            return Center(
              child:Text('Something went wrong...')
            );
          }
          return Center(
            child: CircularProgressIndicator()
          );
        }
    );
  }
}