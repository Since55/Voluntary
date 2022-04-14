import 'package:firebase_auth/firebase_auth.dart';

class AuthApi {
  static Future<void> login(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

}
