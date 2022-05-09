import 'package:flutter/material.dart';
import 'package:voluntary/core/app_navigator.dart';
import 'package:voluntary/core/controller.dart';
import 'package:voluntary/modules/posts_module/pages/post_page/controller/post_controller.dart';
import 'package:voluntary/modules/posts_module/pages/post_page/view/post_view.dart';
import 'package:voluntary/widgets/loader.dart';

class PostPage extends ControllerView<PostController> {
  static const path = '/post';

  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Updater<PostController>(
      controller: PostController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Voluntary'),
          centerTitle: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => AppNavigator.navigator!
                .popUntil((route) => route.settings.name == '/'),
          ),
        ),
        body: controller.post == null
            ? const Loader()
            : PostView(controller.post!),
      ),
    );
  }
}
