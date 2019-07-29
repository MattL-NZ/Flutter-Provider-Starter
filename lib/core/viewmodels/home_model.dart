import 'package:provider_architecutre/core/constants/enums.dart';
import 'package:provider_architecutre/core/models/post.dart';
import 'package:provider_architecutre/core/services/api.dart';
import 'package:provider_architecutre/core/services/postservice.dart';
import 'package:provider_architecutre/core/viewmodels/base_model.dart';

import '../../locator.dart';

/*
    A viewmodel is used as a joiner between the UI and services. This class handles
    communication from the UI which it then goes to the service and requests the information.
    Once retreived, it returns it back to the UI class.
    ViewModels should be used for all UI elements that need to do something.
*/

class HomeModel extends BaseModel {
  PostService _postService = locator<PostService>();
  
  List<Post> get posts => _postService.posts;
  
  Future getPost(userId) async {
    setState(ViewState.Busy);
    await _postService.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}