import 'package:provider_architecutre/core/constants/enums.dart';
import 'package:provider_architecutre/core/models/comment.dart';
import 'package:provider_architecutre/core/services/api.dart';
import 'package:provider_architecutre/core/viewmodels/base_model.dart';
import 'package:provider_architecutre/locator.dart';

class CommentsModel extends BaseModel {
  Api _api = locator<Api>();

  List<Comment> comments;

  Future fetchComments(int postId) async {
    setState(ViewState.Busy);
    comments = await _api.getCommentsForPost(postId);
    setState(ViewState.Idle);

    return comments;
  }
}