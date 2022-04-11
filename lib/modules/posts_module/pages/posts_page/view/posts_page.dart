import 'package:flutter/material.dart';

import 'package:voluntary/core/controller.dart';
import 'package:voluntary/modules/posts_module/pages/posts_page/controller/posts_controller.dart';
import 'package:voluntary/modules/posts_module/pages/posts_page/view/posts_list.dart';
import 'package:voluntary/widgets/loader.dart';

class PostsPage extends ControllerView<PostsController> {
  static const path = '/posts';

  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Voluntary'), centerTitle: false),
      body: Updater<PostsController>(
        controller: PostsController(),
        builder: (_) {
          if (controller.isLoading) return const Loader();
          return LayoutBuilder(
            builder: (_, constraints) {
              final smallScreen = constraints.maxWidth > 1000;
              return Row(
                children: [
                  if (smallScreen) const Spacer(),
                  SizedBox(
                    width: 550,
                    child: PostsList(
                      controller.posts,
                      onTap: controller.handleTapPost,
                    ),
                  ),
                  if (smallScreen) const Spacer(),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
