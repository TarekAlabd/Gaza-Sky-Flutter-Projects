import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_colors.dart';

class ProductSpecsItem extends StatelessWidget {
  final String title;
  final String value;
  const ProductSpecsItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: AppColors.grey,
              ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
