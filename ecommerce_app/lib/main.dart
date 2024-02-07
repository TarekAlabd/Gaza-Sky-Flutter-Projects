import 'package:ecommerce_app/utils/app_theme.dart';
import 'package:ecommerce_app/utils/route/app_router.dart';
import 'package:ecommerce_app/utils/route/app_routes.dart';
import 'package:ecommerce_app/views/pages/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: AppTheme.lightTheme(),
      initialRoute: AppRoutes.bottomNavbar,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
