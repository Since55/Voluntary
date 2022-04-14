import 'package:firebase_auth/firebase_auth.dart';

class AppState {
  static bool get isAuthorized => user != null;

  static User? get user => FirebaseAuth.instance.currentUser;
}
