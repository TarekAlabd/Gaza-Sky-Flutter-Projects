import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/category.dart';
import 'package:food_delivery_app/models/product.dart';
import 'package:food_delivery_app/utils/app_routes.dart';
import 'package:food_delivery_app/views/widgets/product_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  String? selectedCategoryId;
  late List<Product> filteredProducts;

  @override
  void initState() {
    super.initState();
    filteredProducts = dummyProducts;
    debugPrint('HomePage initState()');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('HomePage build()');
    final orientation = MediaQuery.of(context).orientation;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                  'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/delicious-food-banner-template-design-cd3994e39458960f4f33e73b8c60edb9_screen.jpg'),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Find your food!',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 120,
              child: ListView.builder(
                itemCount: dummyCategories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final dummyCategory = dummyCategories[index];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        // if the category is already selected, unselect it
                        if (selectedCategoryId != null &&
                            selectedCategoryId == dummyCategory.id) {
                          selectedCategoryId = null;
                          filteredProducts = dummyProducts;
                          // if the category is not selected, select it
                        } else {
                          selectedCategoryId = dummyCategory.id;
                          filteredProducts = dummyProducts
                              .where((product) =>
                                  product.category.id == selectedCategoryId)
                              .toList();
                        }
                      });
                    },
                    child: Card(
                      color: selectedCategoryId == dummyCategory.id
                          ? Theme.of(context).primaryColor
                          : null,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              dummyCategory.imgUrl,
                              width: 50,
                              color: selectedCategoryId == dummyCategory.id
                                  ? Colors.white
                                  : null,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              dummyCategory.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    color:
                                        selectedCategoryId == dummyCategory.id
                                            ? Colors.white
                                            : null,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            if (filteredProducts.isNotEmpty)
              GridView.builder(
                itemCount: filteredProducts.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: orientation == Orientation.portrait ? 2 : 5,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                itemBuilder: (_, index) {
                  final dummyProduct = filteredProducts[index];
                  return InkWell(
                    onTap: () => Navigator.of(context)
                        .pushNamed(
                          AppRoutes.productDetails,
                          arguments: dummyProduct,
                        )
                        .then((value) => setState(() {})),
                    child: ProductItem(product: dummyProduct),
                  );
                },
              ),
            if (filteredProducts.isEmpty)
              const Center(
                child: Text('No products found'),
              ),
          ],
        ),
      ),
    );
  }
}
