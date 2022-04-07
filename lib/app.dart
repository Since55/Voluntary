import 'package:flutter/material.dart';
import 'package:voluntary/modules/home_module/view/home_page.dart';
import 'package:voluntary/modules/login_module/view/login_page.dart';

import 'core/app_state.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppState.isAuthorized ? HomePage() : LoginPage();
  }
}
