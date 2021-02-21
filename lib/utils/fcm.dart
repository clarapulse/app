import 'package:firebase_messaging/firebase_messaging.dart';

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

void setupFirebase() async {
  await _firebaseMessaging.requestNotificationPermissions();
}
