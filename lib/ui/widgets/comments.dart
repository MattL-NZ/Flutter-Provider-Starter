import 'package:flutter/material.dart';
import 'package:provider_architecutre/core/constants/enums.dart';
import 'package:provider_architecutre/core/models/comment.dart';
import 'package:provider_architecutre/core/viewmodels/comments_model.dart';
import 'package:provider_architecutre/ui/shared/app_colors.dart';
import 'package:provider_architecutre/ui/shared/ui_helpers.dart';
import 'package:provider_architecutre/ui/views/base_view.dart';

/*
    Any widgets that take quite a bit of programming to create should be separated 
    into their own classes. This is purely done to make the view classes easier to
    read and understand.
*/

class Comments extends StatelessWidget {
  final int postId;
  Comments(this.postId);

  @override
  Widget build(BuildContext context) {
    return BaseView<CommentsModel>(
      onModelReady: (model) => model.fetchComments(postId),
      builder: (context, model, child) => model.state == ViewState.Busy
      ? Center(child: CircularProgressIndicator(),)
      : Expanded(
        child: ListView(
          children: model.comments.map((comment) => CommentItem(comment)).toList()
        ),
      )
    ); 
  }
}

/// Renders a single comment given a comment model
class CommentItem extends StatelessWidget {
  final Comment comment;
  const CommentItem(this.comment);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: commentColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            comment.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          UIHelper.verticalSpaceSmall(),
          Text(comment.body),
        ],
      ),
    );
  }
}
