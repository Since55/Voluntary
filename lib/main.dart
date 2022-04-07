import 'package:flutter/material.dart';
import 'package:voluntary/app.dart';

import 'core/controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voluntary',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const StartScreen(),
    );
  }
}

// class CounterController extends Controller {
//   int c = 0;
//   void inc() {
//     c++;
//     update();
//   }
// }

// class MyHomePage extends ControllerView<CounterController> {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Updater<CounterController>(
//         controller: CounterController(),
//         builder: (_) => InkWell(
//           onTap: controller.inc,
//           child: SizedBox(
//             width: 2000,
//             height: 500,
//             child: Text(controller.c.toString()),
//           ),
//         ),
//       ),
//     );
//   }
// }
