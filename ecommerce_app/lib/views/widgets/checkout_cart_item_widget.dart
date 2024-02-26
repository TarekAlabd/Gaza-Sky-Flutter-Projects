import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/models/cart_orders_model.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CheckoutCartItemWidget extends StatelessWidget {
  final CartOrdersModel cartItem;
  const CheckoutCartItemWidget({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImage(
          imageUrl: cartItem.product.imgUrl,
          height: 120,
          width: 120,
          fit: BoxFit.fill,
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cartItem.product.name,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Text.rich(
              TextSpan(
                text: 'Quantity: ',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: AppColors.grey,
                    ),
                children: [
                  TextSpan(
                    text: cartItem.quantity.toString(),
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                text: 'Size: ',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: AppColors.grey,
                    ),
                children: [
                  TextSpan(
                    text: cartItem.size.name,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
        const Spacer(),
        Text(
          '\$${cartItem.product.price * cartItem.quantity}',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
        ),
      ],
    );
  }
}
