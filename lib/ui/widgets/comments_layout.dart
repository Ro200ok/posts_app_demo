import 'package:flutter/material.dart';
import 'package:posts_app_demo/models/comment/comment.dart';
import 'package:posts_app_demo/ui/components/comment_item.dart';
import 'package:posts_app_demo/ui/components/vertical_padding.dart';

class CommentsLayout extends StatelessWidget {
  const CommentsLayout({super.key, required this.comments});

  final List<Comment> comments;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: comments.length,
        itemBuilder: (context, index) {
          final comment = comments[index];

          return VertiacalPadding(child: CommentItem(comment: comment));
        });
  }
}
