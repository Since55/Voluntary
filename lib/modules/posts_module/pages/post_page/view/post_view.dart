import 'package:flutter/material.dart';
import 'package:voluntary/models/post.dart';

class PostView extends StatelessWidget {
  final Post post;
  const PostView(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: 500,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                post.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                post.author,
                style: const TextStyle(color: Colors.grey),
              ),
              Text(post.data),
            ],
          ),
        ),
      ),
    );
  }
}
