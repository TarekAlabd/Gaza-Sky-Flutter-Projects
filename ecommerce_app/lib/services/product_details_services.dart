import 'package:ecommerce_app/models/cart_orders_model.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/utils/api_paths.dart';

abstract class ProductDetailsServices {
  Future<ProductItemModel> getProduct(String id);
  Future<void> addToCart(String uid, CartOrdersModel cartOrder);
}

class ProductDetailsServicesImpl implements ProductDetailsServices {
  final firestoreService = FirestoreService.instance;

  @override
  Future<ProductItemModel> getProduct(String id) async =>
      await firestoreService.getDocument<ProductItemModel>(
        path: ApiPaths.product(id),
        builder: (data, documentId) =>
            ProductItemModel.fromMap(data, documentId),
      );

  @override
  Future<void> addToCart(String uid, CartOrdersModel cartOrder) async =>
      await firestoreService.setData(
        path: ApiPaths.cartItem(uid, cartOrder.id),
        data: cartOrder.toMap(),
      );
}
