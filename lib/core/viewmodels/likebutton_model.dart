import 'package:provider_architecutre/core/services/postservice.dart';
import 'package:provider_architecutre/core/viewmodels/base_model.dart';
import 'package:provider_architecutre/locator.dart';

class LikeButtonModel extends BaseModel {

  PostService _postService = locator<PostService>();

  int postLikes(int postId) {
    return _postService.posts
      .firstWhere((post) => post.id == postId)
      .likes;
  }

  void increaseLikes(int postId) {
    _postService.incrementLikes(postId);
    notifyListeners();
  }
}