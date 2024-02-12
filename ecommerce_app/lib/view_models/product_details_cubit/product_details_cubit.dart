import 'package:ecommerce_app/models/cart_orders_model.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  ProductSize? size;
  int counter = 0;

  void getProductDetails(String productId) async {
    emit(ProductDetailsLoading());
    try {
      final product =
          dummyProducts.firstWhere((product) => product.id == productId);
      await Future.delayed(const Duration(seconds: 2));
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
      await Future.delayed(const Duration(seconds: 1));
      final product =
          dummyProducts.firstWhere((product) => product.id == productId);
      final cartOrder = CartOrdersModel(
        id: DateTime.now().toIso8601String(),
        product: product,
        totalPrice: counter * product.price,
        quantity: counter,
        size: size!,
      );
      dummyCartOrders.add(cartOrder);
      emit(AddedToCart());
    } catch (e) {
      emit(AddToCartError(e.toString()));
    }
  }
}
