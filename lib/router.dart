import 'package:flutter/material.dart';
import 'package:posts_app_demo/models/post/post.dart';
import 'package:posts_app_demo/ui/post_comments.dart';
import 'package:posts_app_demo/ui/posts_screen.dart';

class AppRoutes {
  static final routes = <String, WidgetBuilder>{
    PostsPage.postsRoute: (context) => const PostsPage(),
    PostComments.postCommentsroute: (context) =>
        PostComments(post: ModalRoute.of(context)?.settings.arguments as Post)
  };
}
