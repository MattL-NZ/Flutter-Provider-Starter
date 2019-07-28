import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecutre/core/models/post.dart';
import 'package:provider_architecutre/ui/views/home_view.dart';
import 'package:provider_architecutre/ui/views/login_view.dart';
import 'package:provider_architecutre/ui/views/post_view.dart';

/*
    The router.dart class is used to handle any navigation throughout the app.
    Router is set up using the onGeneratedRoute parameter on the MaterialApp function
    on the main.dart page. When changing screens, all you need to do is write
    Navigator.pushNamed(context, 'nameOfTheRoute');
*/

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case 'home':
        return MaterialPageRoute(builder: (_) => HomeView());
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginView());
      case 'post':
        var post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => PostView(post: post));
      default:
        return MaterialPageRoute(builder:  (_) => Scaffold(
          body: Center(child: Text('No route found for ${settings.name}')),
        )
      );
    }
  }
}