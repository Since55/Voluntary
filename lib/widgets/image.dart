// // ignore: avoid_web_libraries_in_flutter
// import 'dart:html';

// import 'package:flutter/material.dart';
// import 'dart:ui' as ui;

// /// Displays network image on web without CORS shit
// class WebImage extends StatelessWidget {
//   final String imageUrl;

//   const WebImage(this.imageUrl, {Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // https://github.com/flutter/flutter/issues/41563
//     // ignore: undefined_prefixed_name
//     ui.platformViewRegistry.registerViewFactory(
//       imageUrl,
//       (int _) => ImageElement()..src = imageUrl,
//     );
//     return HtmlElementView(viewType: imageUrl);
//   }
// }
