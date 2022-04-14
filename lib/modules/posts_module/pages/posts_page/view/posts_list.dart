import 'package:flutter/material.dart';
import 'package:voluntary/models/post.dart';

class PostsList extends StatelessWidget {
  final List<Post> posts;
  final void Function(Post)? onTap;

  const PostsList(this.posts, {Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (_, index) => PostCard(
        posts[index],
        onTap: () => onTap?.call(posts[index]),
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final Post post;
  final void Function()? onTap;
  const PostCard(this.post, {Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '${post.date.hour}:${post.date.minute} '
                    '${post.date.day}.${post.date.month}.${post.date.year}',
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Text(
                    post.author,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  Text(post.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
