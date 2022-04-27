import 'package:flutter/material.dart';
import 'package:voluntary/api/posts_api.dart';
import 'package:voluntary/core/app_navigator.dart';
import 'package:voluntary/core/app_state.dart';
import 'package:voluntary/core/controller.dart';
import 'package:voluntary/models/city.dart';
import 'package:voluntary/models/contacts.dart';
import 'package:voluntary/models/post.dart';

class CreatePostController extends Controller {
  final title = TextEditingController();
  final summary = TextEditingController();
  final details = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final telegram = TextEditingController();
  City? city;

  bool formValid = false;
  bool isLoading = false;

  void handleUpdate() {
    formValid = title.text.isNotEmpty &&
        details.text.isNotEmpty &&
        city != null &&
        (email.text.isNotEmpty ||
            phone.text.isNotEmpty ||
            telegram.text.isNotEmpty);
    update();
  }

  void handleSelectCity(City city) {
    this.city = city;
    handleUpdate();
  }

  Future<void> handleTapCreate() async {
    isLoading = true;
    update();
    final post = Post(
      city: city!,
      title: title.text,
      data: details.text,
      date: DateTime.now(),
      description: summary.text,
      author: AppState.user!.displayName ?? AppState.user!.email!,
      contacts: Contacts(
        email: email.text,
        phone: phone.text,
        telegram: telegram.text,
      ),
    );
    await PostsApi.createPost(post);

    isLoading = false;
    update();
    AppNavigator.navigator!.pushReplacementNamed('/');
  }
}
