import 'package:flutter/material.dart';

import 'package:voluntary/core/controller.dart';
import 'package:voluntary/modules/home_module/controller/home_controller.dart';
import 'package:voluntary/modules/home_module/view/posts_list.dart';
import 'package:voluntary/widgets/loader.dart';

class HomePage extends ControllerView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Voluntary'), centerTitle: false),
      body: Updater<HomeController>(
        controller: HomeController(),
        builder: (_) {
          if (controller.isLoading) return const Loader();
          return Row(
            children: [
              const Spacer(flex: 1),
              Expanded(
                flex: 3,
                child: PostsList(controller.posts),
              ),
              const Spacer(flex: 1),
            ],
          );
        },
      ),
    );
  }
}
