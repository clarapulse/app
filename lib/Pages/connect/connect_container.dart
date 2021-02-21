import 'dart:convert';

import 'package:clarapulse/Pages/chat/user_card.dart';
import 'package:clarapulse/Pages/login/sign_in.dart';
import 'package:clarapulse/utils/globals.dart';
import 'package:clarapulse/utils/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';

var logger = getLogger();

class ConnectContainerWidget extends StatefulWidget {
  ConnectContainerWidget({Key key}) : super(key: key);

  @override
  ConnectContainerWidgetState createState() => ConnectContainerWidgetState();
}

Future<List<dynamic>> fetchConnections() async {
  final response = await http.get(
      Uri.https('clarapulsse.loca.lt', 'potentialconnections'),
      headers: await getAuthToken());
  if (response.statusCode == 200) {
    List<dynamic> post = jsonDecode(response.body);
    logger.d(post);
    return post;
  } else {
    throw Exception('Failed to load post');
  }
}

class ConnectContainerWidgetState extends State<ConnectContainerWidget> {
  Future<List<dynamic>> _post;

  int _currentIndex = 0;

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
        true),
    UserData.fullProfile(
        "example@gmail.com",
        "Jeff Kaplan",
        "https://lh5.googleusercontent.com/-gKe8qUDkXJc/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuclhbf3_xwxozpf8XweRZrtOC91oIA/s96-c/photo.jpg",
        "Dougherty Valley High School",
        "",
        true),
    UserData.fullProfile(
        "example@gmail.com",
        "Alan Smith",
        "https://lh5.googleusercontent.com/-gKe8qUDkXJc/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuclhbf3_xwxozpf8XweRZrtOC91oIA/s96-c/photo.jpg",
        "San Diego University",
        "",
        true)
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
    _post = fetchConnections();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchConnections(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            // Data fetched successfully, display your data here
            return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Container(
                    height: 64,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          ListTile(leading: Icon(CupertinoIcons.search)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 450.0,
                      autoPlay: false,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: snapshot.data
                        .map((card) {
                          return Builder(builder: (BuildContext context) {
                            return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.30,
                                width: MediaQuery.of(context).size.width,
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    color: Colors.blueAccent,
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(height: 60),
                                          ClipOval(
                                              child: Image.network(
                                            card['url'],
                                            fit: BoxFit.cover,
                                            width: 125.0,
                                            height: 125.0,
                                          )),
                                          SizedBox(height: 30),
                                          Text(card['name'],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 22.0,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(height: 15),
                                          Text(
                                              (card['is_highschool'])
                                                  ? card['highschool']
                                                  : card['university'],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.0,
                                              )),
                                          SizedBox(height: 10),
                                          Text(
                                              (card['is_highschool'])
                                                  ? "Prospective Major: " +
                                                      "Computer Science"
                                                  : "Major: " +
                                                      "Computer Science",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.0,
                                              )),
                                          SizedBox(height: 30),
                                          RaisedButton(
                                            splashColor: CupertinoColors
                                                .darkBackgroundGray,
                                            onPressed: () async {
                                              await http.post(
                                                  Uri.https(
                                                      'clarapulsse.loca.lt',
                                                      'connections'),
                                                  headers: await getAuthToken(),
                                                  body: {
                                                    'who': card['user_id']
                                                  });
                                              setState(() {});
                                            },
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            highlightElevation: 0,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 10, 0, 10),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Icon(CupertinoIcons
                                                      .person_badge_plus_fill),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Text(
                                                      'Connect',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        color: CupertinoColors
                                                            .black,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )));
                          });
                        })
                        .toList()
                        .cast<Widget>(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: map<Widget>(list, (index, url) {
                      return Container(
                        width: 10.0,
                        height: 10.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? Colors.blueAccent
                              : Colors.grey,
                        ),
                      );
                    }),
                  ),
                ]);
          } else if (snapshot.hasError) {
            // Data fetched successfully, display your data here
            return Center(child: Text('Something went wrong...'));
          }
          return Center(child: Text('Loading...'));
        });
  }
}
