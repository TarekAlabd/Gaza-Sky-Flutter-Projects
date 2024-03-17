import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/utils/route/app_routes.dart';
import 'package:news_app/view_models/search_cubit/search_cubit.dart';
import 'package:news_app/views/pages/article_page.dart';
import 'package:news_app/views/pages/home_page.dart';
import 'package:news_app/views/pages/search_page.dart';

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
      case AppRoutes.searchRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SearchCubit(),
            child: const SearchPage(),
          ),
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
