import 'package:ecommerce_app/models/cart_orders_model.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:ecommerce_app/services/product_details_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  final productDetailsServices = ProductDetailsServicesImpl();
  final authServices = AuthServicesImpl();

  ProductSize? size;
  int counter = 1;

  Future<void> getProductDetails(String productId) async {
    emit(ProductDetailsLoading());
    try {
      final product = await productDetailsServices.getProduct(productId);
      emit(ProductDetailsLoaded(product));
    } catch (e) {
      emit(ProductDetailsError(e.toString()));
    }
  }

  void incrementCounter() {
    counter++;
    emit(QuantityChanged(counter));
  }

  void decrementCounter() {
    if (counter > 1) {
      counter--;
    }
    emit(QuantityChanged(counter));
  }

  void changeSize(ProductSize value) {
    size = value;
    emit(SizeChanged(size!));
  }

  Future<void> addToCart(String productId) async {
    emit(AddingToCart());
    try {
      final product = await productDetailsServices.getProduct(productId);
      final cartOrder = CartOrdersModel(
        id: DateTime.now().toIso8601String(),
        product: product,
        totalPrice: counter * product.price,
        quantity: counter,
        size: size!,
      );
      final currentUser = await authServices.currentUser();
      await productDetailsServices.addToCart(currentUser!.uid, cartOrder);
      emit(AddedToCart());
    } catch (e) {
      emit(AddToCartError(e.toString()));
    }
  }
}
