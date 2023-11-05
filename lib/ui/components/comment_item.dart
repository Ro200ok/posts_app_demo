import 'package:flutter/material.dart';
import 'package:posts_app_demo/models/comment/comment.dart';
import 'package:posts_app_demo/ui/components/my_reach_text.dart';
import 'package:posts_app_demo/ui/components/vertical_padding.dart';
import 'package:posts_app_demo/utils/extentions/to_uppercase_first_letter.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({super.key, required this.comment});
  final Comment comment;

  @override
  Widget build(BuildContext context) {
    final id = comment.id;
    final body = comment.body;
    final email = comment.email;
    final name = comment.name;
    final postId = comment.postId;
    double cWidth = MediaQuery.of(context).size.width * 0.8;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                VertiacalPadding(
                  child: MyRichText(
                      description: 'Post id: ',
                      item: postId.toString(),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                VertiacalPadding(
                  child: MyRichText(
                      textStyle: Theme.of(context).textTheme.bodySmall,
                      description: 'Comment id: ',
                      item: id.toString(),
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ],
            ),
          ),
          VertiacalPadding(
            child: MyRichText(
                textStyle: Theme.of(context).textTheme.bodySmall,
                description: 'Name: ',
                item: StringExtension(name ?? '').capitalize(),
                color: Colors.lightGreen),
          ),
          VertiacalPadding(
            child: MyRichText(
                textStyle: Theme.of(context).textTheme.bodySmall,
                description: 'Email: ',
                item: email ?? '',
                color: Colors.grey),
          ),
          VertiacalPadding(
            child: MyRichText(
                textStyle: Theme.of(context).textTheme.bodySmall,
                description: 'Body: ',
                item: StringExtension(body ?? '').capitalize(),
                color: Colors.blueGrey),
          ),
        ],
      ),
    );
  }
}
