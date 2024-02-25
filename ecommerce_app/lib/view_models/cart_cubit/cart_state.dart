part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class QuantityCounterLoading extends CartState {
  final String cartOrderId;

  QuantityCounterLoading({required this.cartOrderId});
}

final class QuantityCounterLoaded extends CartState {
  final int value;
  final CartOrdersModel cartOrder;

  QuantityCounterLoaded({
    required this.value,
    required this.cartOrder,
  });
}

final class QuantityCounterError extends CartState {
  final String message;

  QuantityCounterError({required this.message});
}

final class CartLoaded extends CartState {
  final List<CartOrdersModel> cartItems;
  final double subtotal;

  CartLoaded({
    required this.cartItems,
    required this.subtotal,
  });
}

final class CartError extends CartState {
  final String message;

  CartError({
    required this.message,
  });
}
