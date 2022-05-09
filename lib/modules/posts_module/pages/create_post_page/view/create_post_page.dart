import 'package:flutter/material.dart';
import 'package:voluntary/core/controller.dart';
import 'package:voluntary/modules/posts_module/pages/create_post_page/controller/create_post_controller.dart';
import 'package:voluntary/widgets/city_search.dart';

class CreatePostPage extends ControllerView<CreatePostController> {
  static const path = '/create-post';

  const CreatePostPage({Key? key}) : super(key: key);

  Widget _buildHeader(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.grey,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  final _decoration = const InputDecoration(border: OutlineInputBorder());

  @override
  Widget build(BuildContext context) {
    return Updater<CreatePostController>(
      controller: CreatePostController(),
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Voluntary'), centerTitle: false),
        body: LayoutBuilder(
          builder: (_, constraints) {
            final bigScreen = constraints.maxWidth > 1000;
            final width = MediaQuery.of(context).size.width;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    if (bigScreen) const Spacer(),
                    SizedBox(
                      width: width > 832 ? 800 : width - 32,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Form(
                            onChanged: controller.handleUpdate,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _buildHeader('Title'),
                                TextFormField(
                                  maxLength: 64,
                                  decoration: _decoration,
                                  controller: controller.title,
                                ),
                                _buildHeader('Short summary'),
                                TextFormField(
                                  maxLines: null,
                                  maxLength: 256,
                                  decoration: _decoration,
                                  controller: controller.summary,
                                ),
                                _buildHeader('Details'),
                                TextFormField(
                                  maxLines: null,
                                  maxLength: 2048,
                                  decoration: _decoration,
                                  controller: controller.details,
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: TextFormField(
                                        controller: controller.phone,
                                        maxLength: 16,
                                        decoration: _decoration.copyWith(
                                          prefixIcon: const Icon(Icons.phone),
                                          counterText: '',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Flexible(
                                      child: TextFormField(
                                        controller: controller.email,
                                        maxLength: 64,
                                        decoration: _decoration.copyWith(
                                          prefixIcon:
                                              const Icon(Icons.email_outlined),
                                          counterText: '',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Flexible(
                                      child: TextFormField(
                                        controller: controller.telegram,
                                        maxLength: 64,
                                        decoration: _decoration.copyWith(
                                          prefixIcon:
                                              const Icon(Icons.telegram),
                                          counterText: '',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                _buildHeader('City'),
                                CitySearch(controller.handleSelectCity),
                                const SizedBox(height: 16),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: ElevatedButton(
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('Create'),
                                    ),
                                    onPressed: controller.formValid &&
                                            !controller.isLoading
                                        ? controller.handleTapCreate
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (bigScreen) const Spacer(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
