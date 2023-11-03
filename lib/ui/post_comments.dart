import 'package:flutter/material.dart';
import 'package:posts_app_demo/models/comment/comment.dart';
import 'package:posts_app_demo/repositories/post_comments_repository.dart';

class PostComments extends StatefulWidget {
  static const String postCommentsroute = 'postcomments';
  const PostComments({super.key, required this.postId});
  final int postId;

  @override
  State<PostComments> createState() => _PostCommentsState();
}

class _PostCommentsState extends State<PostComments> {
  final _postCommentsRepository = PostCommentsRepositoriy();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder<List<Comment>>(
            future: _postCommentsRepository.fetchPostComments(widget.postId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting &&
                  snapshot.connectionState == ConnectionState.none) {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: .5,
                  ),
                );
              } else {
                return Container(
                  child: Text(snapshot.data.toString()),
                );
              }
            }),
      ),
    );
  }
}
