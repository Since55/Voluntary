import 'package:flutter/material.dart';
import 'package:voluntary/core/app_router.dart';
import 'package:voluntary/modules/login_module/view/login_page.dart';
import 'package:voluntary/modules/posts_module/pages/posts_page/view/posts_page.dart';

import 'core/app_navigator.dart';
import 'core/app_state.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voluntary',
      home: const StartScreen(),
      debugShowCheckedModeBanner: false,
      navigatorKey: AppNavigator.navigatorKey,
      onGenerateRoute: AppRouter.onGenerateRoute,
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppState.isAuthorized ? const PostsPage() : const LoginPage();
  }
}
