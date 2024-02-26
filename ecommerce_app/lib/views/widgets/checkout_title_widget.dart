import 'package:flutter/material.dart';

class CheckoutTitleWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onEditTap;
  final int? numOfItems;

  const CheckoutTitleWidget({
    super.key,
    required this.title,
    this.onEditTap,
    this.numOfItems,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            if (numOfItems != null)
              Text(
                ' ($numOfItems)',
                style: Theme.of(context).textTheme.titleLarge,
              ),
          ],
        ),
        if (onEditTap != null)
          TextButton(
            onPressed: onEditTap,
            child: const Text('Edit'),
          ),
      ],
    );
  }
}
