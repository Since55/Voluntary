import 'package:voluntary/api/posts_api.dart';
import 'package:voluntary/core/app_router.dart';
import 'package:voluntary/core/controller.dart';
import 'package:voluntary/models/post.dart';

class PostController extends Controller {
  Post? post;
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    _getPost();
  }

  @override
  void onDelete() {
    super.onInit();
    Controllers.delete(PostController());
  }

  Future<void> _getPost() async {
    final id = AppRouter.route!.split('?id=').last;
    isLoading = true;
    update();
    post = await PostsApi.getPost(id);
    isLoading = false;
    update();
  }
}
