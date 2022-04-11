import 'package:flutter/material.dart';
import 'package:voluntary/core/controller.dart';
import 'package:voluntary/models/post.dart';
import 'package:voluntary/modules/posts_module/pages/post_page/controller/post_controller.dart';
import 'package:voluntary/modules/posts_module/pages/post_page/view/post_view.dart';
import 'package:voluntary/widgets/loader.dart';

class PostPage extends ControllerView<PostController> {
  static const path = '/post';

  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Updater<PostController>(
      controller:
          PostController(ModalRoute.of(context)?.settings.arguments as Post? ??
              Post(
                author: 'asdasd',
                data: 'asdasds',
                description: 'adasdasdasdasfadsgfdsfgasdf',
                title: 'asdadsfkjdslkfjlsa',
              )),
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Voluntary'), centerTitle: false),
        body: controller.post == null
            ? const Loader()
            : PostView(controller.post!),
      ),
    );
  }
}
