import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:voluntary/models/post.dart';

class HomeApi {
  static Future<List<Post>> getPosts() async {
    final response = await FirebaseFirestore.instance.collection('posts').get();
    
    return response.docs.map((e) => Post.fromMap(e.data())).toList();
  }
}
