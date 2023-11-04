import 'package:flutter/material.dart';
import 'package:posts_app_demo/models/post/post.dart';
import 'package:posts_app_demo/ui/components/my_reach_text.dart';
import 'package:posts_app_demo/ui/post_comments.dart';
import 'package:posts_app_demo/utils/extentions/to_uppercase_first_letter.dart';

class PostsLayout extends StatelessWidget {
  const PostsLayout({super.key, required this.posts});
  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];

          return Card(
            child: ListTile(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(PostComments.postCommentsroute, arguments: post);
              },
              title: MyRichText(
                  item: StringExtension(post.title ?? '').capitalize(),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    StringExtension(post.body ?? '').capitalize(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  )),
              leading: Text(post.id.toString()),
            ),
          );
        });
  }
}
