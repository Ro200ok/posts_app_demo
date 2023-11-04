import 'package:flutter/material.dart';
import 'package:posts_app_demo/models/comment/comment.dart';
import 'package:posts_app_demo/models/post/post.dart';
import 'package:posts_app_demo/repositories/post_comments_repository.dart';
import 'package:posts_app_demo/ui/components/my_reach_text.dart';
import 'package:posts_app_demo/ui/widgets/comments_layout.dart';
import 'package:posts_app_demo/utils/extentions/to_uppercase_first_letter.dart';

class PostComments extends StatefulWidget {
  static const String postCommentsroute = 'postcomments';
  const PostComments({super.key, required this.post});

  final Post post;

  @override
  State<PostComments> createState() => _PostCommentsState();
}

class _PostCommentsState extends State<PostComments> {
  final _postCommentsRepository = PostCommentsRepositoriy();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: DecoratedBox(
          decoration: BoxDecoration(color: Colors.grey[300]),
          child: CustomScrollView(
            slivers: [
              _buildAppBar(),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: FutureBuilder<List<Comment>>(
                      future: _postCommentsRepository
                          .fetchPostComments(widget.post.id ?? 1),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 1,
                              color: Colors.blueAccent,
                            ),
                          );
                        } else {
                          final comments = snapshot.data;
                          return SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: Column(
                              children: [
                                Expanded(
                                  child: CommentsLayout(
                                    comments: comments ?? [],
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SliverAppBar _buildAppBar() {
    return SliverAppBar(
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Text(''),
      ),
      elevation: 7,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        expandedTitleScale: 1.1,
        centerTitle: true,
        title: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyRichText(
                  textAlign: TextAlign.center,
                  item: StringExtension(widget.post.title ?? '').capitalize(),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              const SizedBox(
                height: 10,
              ),
              MyRichText(
                  textAlign: TextAlign.center,
                  item: StringExtension(widget.post.body ?? '').capitalize(),
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ],
          ),
        ),
        background: Container(
          color: Colors.blue[100],
        ),
      ),
    );
  }
}
