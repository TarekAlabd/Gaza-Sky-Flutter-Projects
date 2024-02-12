import 'package:ecommerce_app/models/product_item_model.dart';

class CartOrdersModel {
  final String id;
  final ProductItemModel product;
  final double totalPrice;
  final int quantity;
  final ProductSize size;

  CartOrdersModel({
    required this.id,
    required this.product,
    required this.totalPrice,
    required this.quantity,
    required this.size,
  });
}

List<CartOrdersModel> dummyCartOrders = [];
