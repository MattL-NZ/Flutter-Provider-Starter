import 'package:provider_architecutre/core/constants/enums.dart';
import 'package:provider_architecutre/core/models/post.dart';
import 'package:provider_architecutre/core/services/api.dart';
import 'package:provider_architecutre/core/services/postservice.dart';
import 'package:provider_architecutre/core/viewmodels/base_model.dart';

import '../../locator.dart';

class HomeModel extends BaseModel {
  PostService _postService = locator<PostService>();
  
  List<Post> get posts => _postService.posts;
  
  Future getPost(userId) async {
    setState(ViewState.Busy);
    await _postService.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}