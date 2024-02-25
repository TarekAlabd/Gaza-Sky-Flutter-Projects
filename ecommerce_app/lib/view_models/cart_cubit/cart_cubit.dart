import 'package:ecommerce_app/models/cart_orders_model.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:ecommerce_app/services/cart_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  final cartServices = CartServicesImpl();
  final authServices = AuthServicesImpl();

  Future<void> getCartItems() async {
    emit(CartLoading());
    try {
      final currentUser = await authServices.currentUser();
      final cartItems = await cartServices.getCartItems(currentUser!.uid);
      final subTotal = cartItems.fold<double>(
          0, (sum, item) => sum + (item.product.price * item.quantity));
      emit(CartLoaded(
        cartItems: cartItems,
        subtotal: subTotal,
      ));
    } catch (e) {
      emit(
        CartError(message: e.toString()),
      );
    }
  }

  // void removeFromCart(String productId) {
  //   emit(CartLoading());
  //   final index = dummyProducts.indexWhere((item) => item.id == productId);
  //   dummyProducts[index] = dummyProducts[index].copyWith(
  //     isAddedToCart: false,
  //     quantity: 0,
  //     size: null,
  //   );
  //   final cartItems =
  //       dummyProducts.where((item) => item.isAddedToCart == true).toList();
  //   final subTotal = cartItems.fold<double>(0, (sum, item) => sum + item.price);
  //   Future.delayed(const Duration(seconds: 1), () {
  //     emit(CartLoaded(
  //       cartItems: cartItems,
  //       subtotal: subTotal,
  //     ));
  //   });
  // }

  Future<void> incrementCounter(CartOrdersModel cartOrder) async {
    emit(QuantityCounterLoading(cartOrderId: cartOrder.id));
    try {
      cartOrder = cartOrder.copyWith(quantity: cartOrder.quantity + 1);
      final currentUser = await authServices.currentUser();
      await cartServices.updateCartItem(
        currentUser!.uid,
        cartOrder,
      );
      emit(
        QuantityCounterLoaded(
          value: cartOrder.quantity,
          cartOrder: cartOrder,
        ),
      );
    } catch (e) {
      emit(QuantityCounterError(message: e.toString()));
    }
  }

  Future<void> decrementCounter(CartOrdersModel cartOrder) async {
    emit(QuantityCounterLoading(cartOrderId: cartOrder.id));
    try {
      cartOrder = cartOrder.copyWith(quantity: cartOrder.quantity - 1);
      final currentUser = await authServices.currentUser();
      await cartServices.updateCartItem(
        currentUser!.uid,
        cartOrder,
      );
      emit(
        QuantityCounterLoaded(
          value: cartOrder.quantity,
          cartOrder: cartOrder,
        ),
      );
    } catch (e) {
      emit(QuantityCounterError(message: e.toString()));
    }
  }
}
