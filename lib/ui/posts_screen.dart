import 'package:flutter/material.dart';
import 'package:posts_app_demo/models/post/post.dart';
import 'package:posts_app_demo/repositories/posts_repository.dart';
import 'package:posts_app_demo/ui/widgets/posts_layout.dart';

class PostsPage extends StatefulWidget {
  static const String postsRoute = '/';
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final _postsRepository = PostsRepositoriy();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Scaffold(
            body: FutureBuilder<List<Post>>(
              future: _postsRepository.fetchPosts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: .5,
                    ),
                  );
                } else {
                  final posts = snapshot.data;
                  return PostsLayout(
                    posts: posts ?? [],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
