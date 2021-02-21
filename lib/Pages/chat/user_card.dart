import 'package:clarapulse/utils/globals.dart';
import 'package:flutter/material.dart';

class UserCardWidget extends StatelessWidget{
  UserCardWidget(this.userInfo, {Key key}) : super(key: key);
  
  final dynamic userInfo;

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Container(
        height: 100,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ListTile(
                leading: ClipOval(
                  child: Image.network(
                    userInfo['url'],
                    fit: BoxFit.cover,
                    width: 60.0,
                    height: 60.0,
                  )
                ),
                title: Text(userInfo['name']),
                subtitle: Text(userInfo['is_highschool'] ? userInfo['highschool'] : userInfo['university']),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

