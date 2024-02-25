import 'package:ecommerce_app/models/cart_orders_model.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  final dynamic cubit;
  final int? counter;
  final CartOrdersModel? cartOrder;
  final bool isLoading;
  const CounterWidget({
    super.key,
    this.cubit,
    this.counter,
    this.cartOrder,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.grey2,
        borderRadius: BorderRadius.circular(16),
      ),
      child: isLoading ? const CircularProgressIndicator.adaptive() : Row(
        children: [
          IconButton(
            onPressed: () async => cartOrder != null
                ? await cubit.decrementCounter(cartOrder)
                : await cubit.decrementCounter(),
            icon: const Icon(Icons.remove),
          ),
          const SizedBox(width: 8),
          Text(
            counter.toString(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () async => cartOrder != null
                ? await cubit.incrementCounter(cartOrder)
                : await cubit.incrementCounter(),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
