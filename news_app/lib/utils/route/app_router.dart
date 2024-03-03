import 'package:flutter/material.dart';
import 'package:news_app/utils/route/app_routes.dart';
import 'package:news_app/views/pages/article_page.dart';
import 'package:news_app/views/pages/home_page.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeRoute:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case AppRoutes.articleRoute:
        return MaterialPageRoute(
          builder: (context) => const ArticlePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
    }
  }
}