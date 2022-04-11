import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:voluntary/app.dart';
import 'package:voluntary/firebase_options.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const App());
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
