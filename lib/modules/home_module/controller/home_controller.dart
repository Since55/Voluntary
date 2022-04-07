import 'package:voluntary/api/home_api.dart';
import 'package:voluntary/core/controller.dart';
import 'package:voluntary/models/post.dart';

class HomeController extends Controller {
  List<Post> posts = [];
  bool isLoading = false;

  @override
  void onInit() {
    _getPosts();
  }

  Future<void> _getPosts() async {
    isLoading = true;
    update();
    posts = await HomeApi.getPosts();
    isLoading = false;
    update();
  }
}
