import 'package:ecommerce_app/models/cart_orders_model.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(dummyCartOrders.length.toString()));
  }
}
