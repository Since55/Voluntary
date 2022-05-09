import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:voluntary/models/post.dart';

class PostsApi {
  static Future<List<Post>> getPosts() async {
    final response = await FirebaseFirestore.instance.collection('posts').get();

    return response.docs
        .map((e) => Post.fromMap(e.data(), e.reference.id))
        .toList()
      ..sort((a, b) => b.date.compareTo(a.date));
  }

  static Future<Post> getPost(String id) async {
    final response =
        await FirebaseFirestore.instance.collection('posts').doc(id).get();
    return Post.fromMap(response.data()!, id);
  }

  static Future<void> createPost(Post post) async {
    await FirebaseFirestore.instance.collection('posts').add(post.toMap());
  }
}
