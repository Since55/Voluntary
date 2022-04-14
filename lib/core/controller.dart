import 'package:flutter/material.dart';
import 'package:voluntary/core/app_navigator.dart';

class Controllers {
  static final List<Controller> _controllers = [];

  static void put<T extends Controller>(T controller) {
    if (_controllers.any((element) => element.runtimeType is T)) return;
    _controllers.add(controller);
  }

  static void delete<T extends Controller>(T controller) {
    _controllers.removeWhere((e) => e.runtimeType == T);
  }

  static T find<T extends Controller>() {
    return _controllers.firstWhere((c) => c is T) as T;
  }
}

abstract class Controller extends ChangeNotifier {
  Controller() {
    onInit();
  }

  void onInit() {}

  void update() {
    notifyListeners();
  }

  void onDelete() {}
}

class Updater<T extends Controller> extends StatefulWidget {
  final T controller;
  final Widget Function(BuildContext) builder;
  final void Function()? onInit;

  const Updater({
    this.onInit,
    required this.builder,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  State<Updater> createState() => _UpdaterState();
}

class _UpdaterState<T extends Controller> extends State<Updater<T>> {
  @override
  void initState() {
    Controllers.put(widget.controller);
    super.initState();
    widget.controller.addListener(() => setState(() {}));
    widget.onInit?.call();
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(() => setState(() {}));
    widget.controller.onDelete();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}

abstract class ControllerView<T extends Controller> extends StatelessWidget {
  const ControllerView({Key? key}) : super(key: key);

  T get controller => Controllers.find<T>();

  @override
  Widget build(BuildContext context);
}
