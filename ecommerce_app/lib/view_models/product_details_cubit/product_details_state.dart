part of 'product_details_cubit.dart';

sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsLoading extends ProductDetailsState {}

final class ProductDetailsLoaded extends ProductDetailsState {
  final ProductItemModel product;

  ProductDetailsLoaded(this.product);
}

final class ProductDetailsError extends ProductDetailsState {
  final String message;

  ProductDetailsError(this.message);
}

final class AddingToCart extends ProductDetailsState {}

final class AddedToCart extends ProductDetailsState {}

final class AddToCartError extends ProductDetailsState {
  final String message;

  AddToCartError(this.message);
}

final class QuantityChanged extends ProductDetailsState {
  final int quantity;

  QuantityChanged(this.quantity);
}

final class SizeChanged extends ProductDetailsState {
  final ProductSize size;

  SizeChanged(this.size);
}
