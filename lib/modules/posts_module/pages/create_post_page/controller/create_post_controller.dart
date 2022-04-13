import 'package:flutter/material.dart';
import 'package:voluntary/core/controller.dart';

class CreatePostController extends Controller {
  final title = TextEditingController();
  final summary = TextEditingController();
  final details = TextEditingController();

  bool formValid = false;

  void handleUpdate() {
    formValid = title.text.isNotEmpty && details.text.isNotEmpty;
    update();
  }

  Future<void> handleTapCreate() async {}
}
