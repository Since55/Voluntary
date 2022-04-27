import 'package:voluntary/api/posts_api.dart';
import 'package:voluntary/core/app_navigator.dart';
import 'package:voluntary/core/controller.dart';
import 'package:voluntary/models/post.dart';
import 'package:voluntary/modules/login_module/view/login_page.dart';
import 'package:voluntary/modules/posts_module/pages/create_post_page/view/create_post_page.dart';
import 'package:voluntary/modules/posts_module/pages/post_page/view/post_page.dart';
import 'package:voluntary/widgets/search.dart';

class PostsController extends Controller {
  List<Post> _posts = [];
  List<Post> toDisplayPosts = [];
  bool isLoading = false;

  @override
  void onInit() {
    _getPosts();
  }

  void handleTapLogin() {
    AppNavigator.navigator!.pushNamed(LoginPage.path);
  }

  Future<void> handleSearch(String query, SearchType type) async {
    toDisplayPosts = _posts
        .where((post) =>
            (type == SearchType.postName ? post.title : post.city.fullName)
                .toLowerCase()
                .contains(query.toLowerCase()))
        .toList();
    update();
  }

  void handleTapPost(Post post) {
    AppNavigator.navigator
        ?.pushNamed('${PostPage.path}/?id=${post.id}', arguments: post);
  }

  void handleTapNewPost() {
    AppNavigator.navigator!.pushNamed(CreatePostPage.path);
  }

  Future<void> _getPosts() async {
    isLoading = true;
    update();
    _posts = await PostsApi.getPosts();
    toDisplayPosts = _posts;
    isLoading = false;
    update();
  }
}
