import 'package:clarapulse/Pages/connect/connect_container.dart';
import 'package:clarapulse/utils/globals.dart';
import 'package:clarapulse/utils/logger.dart';
import 'package:clarapulse/utils/twilio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:twilio_programmable_video_example/room/join_room_page.dart';
import 'package:twilio_programmable_video/twilio_programmable_video.dart';

var logger = getLogger();

class ChatWidget extends StatefulWidget {
  ChatWidget(this.friendID, this.roomID);

  final String friendID;
  final String roomID;

  @override
  ChatWidgetState createState() => ChatWidgetState();
}

class ChatWidgetState extends State<ChatWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat with ${widget.friendID}')),
      body: Container(
        child: Align(
            // alignment: FractionalOffset.bottomCenter,
            // child: GestureDetector(
            //   onTap: () async {
//               await connectToRoom(widget.roomID);

// // A video track request an implementation of VideoCapturer.
//               var cameraCapturer = CameraCapturer(CameraSource.FRONT_CAMERA);

// // Create a video track.
            // var localVideoTrack = LocalVideoTrack(true, cameraCapturer);

// // Getting the local video track widget.
// // This can only be called after the TwilioProgrammableVideo.connect() is called.
//               var videoTrackWidget = localVideoTrack.widget();
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => videoTrackWidget));
            // },
            // child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // children: <Widget>[
            // Text(
            // 'Start a call',
            // style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            // ),
            // Container(child: Icon(CupertinoIcons.videocam_fill, size: 60))
            // ],
            ),
      ),
      // ),
      // ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.video_call),
        onPressed: () async {
          print('hi');
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) =>
          // TwilioVideo(),
          //       ),
          // );
        },
      ),
    );
  }
}

class UserCardWidget extends StatelessWidget {
  UserCardWidget(this.userInfo, {Key key}) : super(key: key);

  final dynamic userInfo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => ChatWidget('lol', 'idk')),
          );
        },
        child: Center(
          child: Container(
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
                    )),
                    title: Text(userInfo['name']),
                    subtitle: Text(userInfo['is_highschool']
                        ? userInfo['highschool']
                        : userInfo['university']),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
