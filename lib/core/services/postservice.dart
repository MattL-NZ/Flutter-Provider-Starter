import 'package:provider_architecutre/core/models/post.dart';
import 'package:provider_architecutre/core/services/api.dart';
import 'package:provider_architecutre/locator.dart';

/*
    Services can be split into certain classes doing certain functions.
    For example, this class injects the API service and retrieves all posts
    for a specific user id which is what it does inside the API service. 
    We are doing this again inside this class so we can call another method
    to handle ncrementing likes.
*/

class PostService {
  Api _api = locator<Api>();
  
  List<Post> _posts;
  List<Post> get posts => _posts;

  Future getPostsForUser(int userId) async {
    _posts = await _api.getPostsForUser(userId);
  }

  void incrementLikes(int postId) {
    _posts.firstWhere((post) => post.id == postId).likes++;
  }

}