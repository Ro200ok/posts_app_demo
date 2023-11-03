import 'package:flutter/material.dart';
import 'package:posts_app_demo/router.dart';
import 'package:posts_app_demo/ui/post_comments.dart';
import 'package:posts_app_demo/ui/posts_screen.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      initialRoute: PostsPage.postsRoute,
      routes: AppRoutes.routes,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
