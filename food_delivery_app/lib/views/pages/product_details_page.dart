import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/product.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:food_delivery_app/views/widgets/counter_widget.dart';
import 'package:food_delivery_app/views/widgets/product_specs_item.dart';

class ProductDetailsPage extends StatefulWidget {
  // final Product product;
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.grey2,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (favProducts.contains(product)) {
                  favProducts.remove(product);
                } else {
                  favProducts.add(product);
                }
              });
            },
            icon: Icon(
              favProducts.contains(product)
                  ? Icons.favorite
                  : Icons.favorite_border,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.grey2,
              ),
              child: Padding(
                padding: const EdgeInsets.all(
                  50,
                ),
                child: Image.network(
                  product.imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            product.category.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: AppColors.grey,
                                ),
                          ),
                        ],
                      ),
                      const CounterWidget(),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductSpecsItem(title: 'Size', value: 'Large'),
                      SizedBox(height: 30, child: VerticalDivider()),
                      ProductSpecsItem(title: 'Calories', value: '120 Cal'),
                      SizedBox(height: 30, child: VerticalDivider()),
                      ProductSpecsItem(title: 'Cooking', value: '10 mins'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    product.description,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.grey,
                        ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '\$${product.price}',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              foregroundColor: AppColors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: const Text('Add to cart'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
