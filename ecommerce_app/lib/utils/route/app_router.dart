import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/utils/route/app_routes.dart';
import 'package:ecommerce_app/views/pages/custom_bottom_navbar.dart';
import 'package:ecommerce_app/views/pages/product_details_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.productDetails:
        final product = settings.arguments as ProductItemModel;
        return MaterialPageRoute(
          builder: (_) => ProductDetailsPage(
            product: product,
          ),
          settings: settings,
        );
      case AppRoutes.bottomNavbar:
        return MaterialPageRoute(
          builder: (_) => const CustomBottomNavbar(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Error Page!'),
            ),
          ),
        );
    }
  }
}
