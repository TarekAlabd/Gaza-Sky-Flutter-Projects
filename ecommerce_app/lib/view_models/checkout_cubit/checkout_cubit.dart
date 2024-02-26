import 'package:ecommerce_app/models/address_model.dart';
import 'package:ecommerce_app/models/cart_orders_model.dart';
import 'package:ecommerce_app/models/payment_method_model.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:ecommerce_app/services/checkout_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());

  final checkoutServices = CheckoutServicesImpl();
  final authServices = AuthServicesImpl();

  Future<void> getCheckoutPage() async {
    emit(CheckoutLoading());
    try {
      final currentUser = await authServices.currentUser();
      final cartItems = await checkoutServices.getCartItems(currentUser!.uid);
      final preferredLocation = (await checkoutServices.getAddresses(
        currentUser.uid,
        fetchPreferred: true,
      ))
          .first;
      final preferredPaymentMethod = (await checkoutServices.getPaymentMethods(
        currentUser.uid,
        fetchPreferred: true,
      ))
          .first;
      final subtotal = cartItems.fold<double>(0, (sum, cartItem) => sum + (cartItem.product.price * cartItem.quantity));
      emit(
        CheckoutLoaded(
          cartItems: cartItems,
          preferredLocation: preferredLocation,
          preferredPaymentMethod: preferredPaymentMethod,
          totalAmount: subtotal + 10,
        ),
      );
    } catch (e) {
      emit(CheckoutError(e.toString()));
    }
  }
}
