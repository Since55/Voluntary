import 'package:voluntary/api/posts_api.dart';
import 'package:voluntary/core/app_navigator.dart';
import 'package:voluntary/core/controller.dart';
import 'package:voluntary/models/post.dart';
import 'package:voluntary/modules/posts_module/pages/post_page/view/post_page.dart';

class PostsController extends Controller {
  List<Post> posts = [];
  bool isLoading = false;

  @override
  void onInit() {
    _getPosts();
  }

  void handleTapPost(Post post) {
    AppNavigator.navigator?.pushNamed(PostPage.path, arguments: post);
  }

  Future<void> _getPosts() async {
    isLoading = true;
    update();
    posts = await PostsApi.getPosts();
    isLoading = false;
    update();
  }
}
