import 'package:flutter/material.dart';
import 'package:voluntary/modules/posts_module/pages/create_post_page/view/create_post_page.dart';
import 'package:voluntary/modules/posts_module/pages/post_page/view/post_page.dart';
import 'package:voluntary/modules/posts_module/pages/posts_page/view/posts_page.dart';

class AppRouter {
  static String? _route = '/';
  static String? get route => _route;

  static Map<String, WidgetBuilder> routes = {
    PostsPage.path: (_) => const PostsPage(),
    PostPage.path: (_) => const PostPage(),
    CreatePostPage.path: (_) => const CreatePostPage(),
  };

  static Route onGenerateRoute(RouteSettings settings) {
    _route = settings.name;
    final _name = settings.name!.contains('/?')
        ? settings.name!.split('/?').first
        : settings.name;
    return MaterialPageRoute(
      builder: (context) => routes[_name]!(context),
      settings: settings,
    );
  }
}
