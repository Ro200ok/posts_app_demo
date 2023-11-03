import 'package:dio/dio.dart';
import 'package:posts_app_demo/api_endpoints.dart';
import 'package:posts_app_demo/models/post/post.dart';

class PostsRepositoriy {
  final _client = Dio();

  Future<List<Post>> fetchPosts() async {
    try {
      final Response response = await _client.get(ApiEndpoints.posts);
      final List<Post> posts = [];
      for (var element in response.data) {
        posts.add(Post.fromJson(element));
      }
      return posts;
    } catch (e) {
      throw DioException.connectionError(
          requestOptions: RequestOptions(), reason: e.toString());
    }
  }
}
