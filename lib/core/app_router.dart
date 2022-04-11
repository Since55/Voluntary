import 'package:flutter/material.dart';
import 'package:voluntary/modules/posts_module/pages/post_page/view/post_page.dart';
import 'package:voluntary/modules/posts_module/pages/posts_page/view/posts_page.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    PostsPage.path: (_) => const PostsPage(),
    PostPage.path: (_) => const PostPage(),
  };

  static Route onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => routes[settings.name]!(context),
      settings: settings,
    );
  }
}
