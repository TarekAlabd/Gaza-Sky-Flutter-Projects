import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/utils/route/app_routes.dart';
import 'package:ecommerce_app/view_models/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_app/views/widgets/cart_item_widget.dart';
import 'package:ecommerce_app/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dash/flutter_dash.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<CartCubit, CartState>(
      bloc: BlocProvider.of<CartCubit>(context),
      buildWhen: (previous, current) =>
          current is CartLoaded ||
          current is CartLoading ||
          current is CartError,
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is CartLoaded) {
          return RefreshIndicator(
            onRefresh: () => BlocProvider.of<CartCubit>(context).getCartItems(),
            child: ListView(
              children: [
                ListView.builder(
                  itemCount: state.cartItems.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = state.cartItems[index];
                    return CartItemWidget(cartOrderItemOriginal: item);
                  },
                ),
                const SizedBox(height: 24),
                buildTotalAndSubtotalItem(context, 'Subtotal', state.subtotal),
                const SizedBox(height: 8),
                buildTotalAndSubtotalItem(context, 'Shipping', 10),
                const SizedBox(height: 16),
                Dash(
                  length: size.width - 32,
                  dashLength: 12,
                  dashColor: AppColors.grey,
                ),
                const SizedBox(height: 16),
                buildTotalAndSubtotalItem(
                    context, 'Total Amount', state.subtotal + 10),
                const SizedBox(height: 36),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: MainButton(
                      onPressed: () {
                          Navigator.of(context, rootNavigator: true).pushNamed(
                          AppRoutes.checkoutRoute,
                        );
                      },
                      child: const Text('Checkout'),
                    ),
                  ),
                ),
                const SizedBox(height: 36),
              ],
            ),
          );
        } else if (state is CartError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget buildTotalAndSubtotalItem(
    BuildContext context,
    String title,
    double value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: AppColors.grey,
                ),
          ),
          Text(
            '\$$value',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
