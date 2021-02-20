import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:logger_flutter/logger_flutter.dart';
import './utils/logger.dart';

void main() {
  // var logger = getLogger();

  // logger.d("Logger is working!");
  // logger.v("Logger is working!");
  // try {
  //   var a = 12;
  //   var b = 0;
  //   var c = a ~/ b;
  // } catch (err, st) {
  //   logger.e('B is zero', err, st);
  // }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return CupertinoApp(
      title: 'Clarapulse',
      theme: const CupertinoThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        brightness: Brightness.light,
        // is not restarted.
      ),
      home: MyHomePage(title: 'Clarapulse'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration(milliseconds: 500), () {
    //   LogConsole.open(context);
    // });
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          // leading: GestureDetector(
          //   onTap: () {
          //     debugPrint('Back button tapped');
          //   },
          //   child: Row(
          //     children: <Widget>[
          //       Icon(CupertinoIcons.arrow_left),
          //       Text(
          //         'Back',
          //         style: TextStyle(
          //           color: CupertinoColors.activeBlue,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          middle: Text(widget.title),
          trailing: GestureDetector(
            onTap: () {
              _incrementCounter();
            },
            child: Icon(
              CupertinoIcons.add,
              color: CupertinoColors.black,
            ),
          ),
        ),
        child: Center(
          //  Column(
          child:
              // mainAxisAlignment: MainAxisAlignment.center,
              // children: <Widget>[
              Text(
            "You've tapped this button $_counter times",
            style: TextStyle(fontSize: 36.0),
            textAlign: TextAlign.center,
          ),
        )
        // ])),
        );
  }
}

const a = 5;
