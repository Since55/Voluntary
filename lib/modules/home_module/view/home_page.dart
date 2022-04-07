import 'package:flutter/material.dart';

import 'package:voluntary/core/controller.dart';
import 'package:voluntary/modules/home_module/controller/home_controller.dart';

class HomePage extends ControllerView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Voluntary')),
      body: Container(),
    );
  }
}
