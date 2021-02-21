import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
String name;
String email;
String imageURL;

class UserData {
  final String name;
  final String photoURL;
  final String email;
  UserData(this.name, this.photoURL, this.email);
}

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount account = await googleSignIn.signIn();
  final GoogleSignInAuthentication authentication = await account.authentication;

  final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      idToken: authentication.idToken,
      accessToken: authentication.accessToken);

  final UserCredential authResult = await _auth.signInWithCredential(credential);
  final User user = authResult.user;
  assert(user.email != null);
  assert(user.displayName != null);
  assert(user.photoURL != null);
  name = user.displayName;
  email = user.email;
  imageURL = user.photoURL;
  return 'signInWithGoogle succeeded: $user';
}

void signOutGoogle() async{
  await googleSignIn.signOut();

  print("User Sign Out");
}