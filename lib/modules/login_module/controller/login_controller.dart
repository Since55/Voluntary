import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:voluntary/api/auth_api.dart';
import 'package:voluntary/core/app_navigator.dart';
import 'package:voluntary/core/controller.dart';

class LoginController extends Controller {
  final login = TextEditingController();
  final password = TextEditingController();

  bool isLoading = false;

  String? errorText;

  Future<void> handleTapLogin() async {
    errorText = null;
    isLoading = true;
    update();
    try {
      await AuthApi.login(login.text, password.text);
      AppNavigator.navigator!.pushReplacementNamed('/');
    } on FirebaseAuthException catch (e) {
      errorText = e.message;
    } finally {
      isLoading = false;
      update();
    }
  }
}
