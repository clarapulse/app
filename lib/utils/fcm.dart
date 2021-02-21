import 'package:firebase_messaging/firebase_messaging.dart';

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

Future<void> setupFCM() async {
  await _firebaseMessaging.requestNotificationPermissions();
}
