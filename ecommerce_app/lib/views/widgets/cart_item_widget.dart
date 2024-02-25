import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/models/cart_orders_model.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/view_models/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_app/views/widgets/counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemWidget extends StatelessWidget {
  final CartOrdersModel cartOrderItemOriginal;
  const CartItemWidget({
    super.key,
    required this.cartOrderItemOriginal,
  });

  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.grey.withOpacity(0.4),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Stack(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      imageUrl: cartOrderItemOriginal.product.imgUrl,
                      fit: BoxFit.cover,
                      height: 120,
                      width: 200,
                    ),
                  ),
                ),
                PositionedDirectional(
                  end: 8,
                  top: 8,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.red.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.delete_outline,
                        size: 30,
                      ),
                      color: AppColors.red,
                      onPressed: () {},
                      // onPressed: () =>
                      //     cartCubit.removeFromCart(addToCartItem.id),
                    ),
                  ),
                ),
                PositionedDirectional(
                  start: 8,
                  bottom: 8,
                  child: BlocBuilder<CartCubit, CartState>(
                    bloc: cartCubit,
                    buildWhen: (previous, current) =>
                        (current is QuantityCounterLoading &&
                            current.cartOrderId == cartOrderItemOriginal.id) ||
                        (current is QuantityCounterLoaded &&
                            current.cartOrder.id == cartOrderItemOriginal.id),
                    builder: (context, state) {
                      if (state is QuantityCounterLoaded) {
                        return CounterWidget(
                          cubit: BlocProvider.of<CartCubit>(context),
                          counter: state.value,
                          cartOrder: state.cartOrder,
                          // productItem: addToCartItem.product,
                        );
                      } else if (state is CartLoaded) {
                        return CounterWidget(
                            cubit: BlocProvider.of<CartCubit>(context),
                            // productItem: addToCartItem.product,
                            cartOrder: cartOrderItemOriginal,
                            counter: state.cartItems
                                .firstWhere(
                                  (item) => item.id == cartOrderItemOriginal.id,
                                )
                                .quantity);
                      } else if (state is QuantityCounterLoading) {
                        return const CounterWidget(
                          isLoading: true,
                        );
                      } else {
                        return CounterWidget(
                            cubit: BlocProvider.of<CartCubit>(context),
                            // productItem: addToCartItem.product,
                            cartOrder: cartOrderItemOriginal,
                            counter: 1);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartOrderItemOriginal.product.name,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  if (cartOrderItemOriginal.size != null)
                    Text.rich(
                      TextSpan(
                        text: 'Size: ',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: AppColors.grey,
                                ),
                        children: [
                          TextSpan(
                            text: cartOrderItemOriginal.size!.name,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              Text(
                '\$${cartOrderItemOriginal.product.price * cartOrderItemOriginal.quantity}',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
