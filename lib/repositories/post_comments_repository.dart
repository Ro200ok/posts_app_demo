import 'package:dio/dio.dart';
import 'package:posts_app_demo/api_endpoints.dart';
import 'package:posts_app_demo/models/comment/comment.dart';

class PostCommentsRepositoriy {
  final _client = Dio();

  Future<List<Comment>> fetchPostComments(int id) async {
    try {
      final Response response =
          await _client.get('${ApiEndpoints.postsComments}?postId=$id');
      final List<Comment> comments = [];
      for (var element in response.data) {
        comments.add(Comment.fromJson(element));
      }
      return comments;
    } catch (e) {
      throw DioException.connectionError(
          requestOptions: RequestOptions(), reason: e.toString());
    }
  }
}
