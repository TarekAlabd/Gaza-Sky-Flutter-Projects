import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_routes.dart';
import 'package:food_delivery_app/utils/app_theme.dart';
import 'package:food_delivery_app/views/pages/custom_bottom_navbar.dart';
import 'package:food_delivery_app/views/pages/product_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery App',
      theme: AppTheme.lightTheme,
      home: const CustomBottomNavbar(),
      routes: {
        AppRoutes.productDetails: (context) => const ProductDetailsPage(),
      },
    );
  }
}
