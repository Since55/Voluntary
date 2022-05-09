import 'package:flutter/material.dart';
import 'package:voluntary/core/app_state.dart';

import 'package:voluntary/core/controller.dart';
import 'package:voluntary/modules/posts_module/pages/posts_page/controller/posts_controller.dart';
import 'package:voluntary/modules/posts_module/pages/posts_page/view/posts_list.dart';
import 'package:voluntary/widgets/loader.dart';
import 'package:voluntary/widgets/search.dart';

class PostsPage extends ControllerView<PostsController> {
  static const path = '/posts';

  const PostsPage({Key? key}) : super(key: key);

  Widget? _buildNewPostButton() {
    if (!AppState.isAuthorized) return null;

    return FloatingActionButton(
      onPressed: controller.handleTapNewPost,
      child: const Icon(Icons.add),
    );
  }

  Widget _buildLoginButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: controller.handleTapLogin,
        child: const Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Updater<PostsController>(
      controller: PostsController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Voluntary'),
          centerTitle: false,
          actions: [
            if (!AppState.isAuthorized) _buildLoginButton(),
          ],
        ),
        floatingActionButton: _buildNewPostButton(),
        body: controller.isLoading
            ? const Loader()
            : LayoutBuilder(
                builder: (_, constraints) {
                  final bigScreen = constraints.maxWidth > 1000;
                  return Column(
                    children: [
                      Search(controller.handleSearch),
                      Expanded(
                        child: Row(
                          children: [
                            if (bigScreen) const Spacer(),
                            SizedBox(
                              width: bigScreen ? 550 : constraints.maxWidth,
                              child: PostsList(
                                controller.toDisplayPosts,
                                onTap: controller.handleTapPost,
                              ),
                            ),
                            if (bigScreen) const Spacer(),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
