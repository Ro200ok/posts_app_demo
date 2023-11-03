import 'package:flutter/material.dart';
import 'package:posts_app_demo/models/post/post.dart';
import 'package:posts_app_demo/repositories/posts_repository.dart';
import 'package:posts_app_demo/ui/post_comments.dart';

class PostsPage extends StatefulWidget {
  static const String postsRoute = '/';
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final _postsRepository = PostsRepositoriy();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Scaffold(
          body: FutureBuilder<List<Post>>(
            future: _postsRepository.fetchPosts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting &&
                  snapshot.connectionState == ConnectionState.none) {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: .5,
                  ),
                );
              } else {
                final posts = snapshot.data;
                return ListView.builder(
                    itemCount: posts?.length,
                    itemBuilder: (context, index) {
                      final post = posts?[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              PostComments.postCommentsroute,
                              arguments: post?.id);
                        },
                        child: Card(
                          child: ListTile(
                            title: Text(
                              post?.title ?? '',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            subtitle: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  post?.body ?? '',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                )),
                            leading: Text(post?.id.toString() ?? ''),
                          ),
                        ),
                      );
                    });
              }
            },
          ),
        ),
      ),
    );
  }
}
