import 'package:clarapulse/utils/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class UserCardWidget extends StatefulWidget {
  UserCardWidget({Key key}) : super(key: key);

  @override
  UserCardWidgetState createState() => UserCardWidgetState();
}
class UserCardWidgetState extends  State<UserCardWidget>{
  Future<http.Response> fetchConnections() {
    return http.get(Uri.https('clarapulse.loca.lt', 'connections'));
  }
  @override
  Widget build(BuildContext context) {
    fetchConnections();
    return Center(
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
                    localUser.photoURL,
                    fit: BoxFit.cover,
                    width: 60.0,
                    height: 60.0,
                  )
                ),
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