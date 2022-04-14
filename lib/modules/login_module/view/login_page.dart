import 'package:flutter/material.dart';
import 'package:voluntary/core/controller.dart';
import 'package:voluntary/modules/login_module/view/login_form.dart';

import '../controller/login_controller.dart';

class LoginPage extends ControllerView<LoginController> {
  static const path = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Updater<LoginController>(
      controller: LoginController(),
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Voluntary'), centerTitle: false),
        body: Center(
          child: LayoutBuilder(
            builder: (_, __) {
              final width = MediaQuery.of(context).size.width;
              return SizedBox(
                width: width > 600 ? 600 : width,
                // ignore: prefer_const_constructors
                child: LoginForm(),
              );
            },
          ),
        ),
      ),
    );
  }
}
