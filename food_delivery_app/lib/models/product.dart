import 'package:food_delivery_app/models/category.dart';

class Product {
  final String id;
  final String name;
  final String imgUrl;
  final String description;
  final double price;
  final Category category;

  Product({
    required this.id,
    required this.name,
    required this.imgUrl,
    this.description =
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    required this.price,
    required this.category,
  });
}

List<Product> favProducts = [];

List<Product> dummyProducts = [
  Product(
      id: '1',
      category: dummyCategories[0],
      name: 'Beef Burger',
      imgUrl:
          'https://static.vecteezy.com/system/resources/thumbnails/022/911/694/small/cute-cartoon-burger-icon-free-png.png',
      price: 6.99),
  Product(
      id: '2',
      category: dummyCategories[0],
      name: 'Chicken Burger',
      imgUrl: 'https://assets.stickpng.com/images/58824b33e81acb96424ffab9.png',
      price: 5.99),
  Product(
      id: '3',
      category: dummyCategories[0],
      name: 'Cheese Burger',
      imgUrl:
          'https://upload.wikimedia.org/wikipedia/commons/1/11/Cheeseburger.png',
      price: 7.99),
  Product(
      id: '4',
      category: dummyCategories[2],
      name: 'Chicken Pizza',
      imgUrl:
          'https://www.pngkey.com/png/full/70-701336_california-chicken-pizza-butter-chicken-pizza-png.png',
      price: 9.99),
  Product(
      id: '5',
      category: dummyCategories[2],
      name: 'Margreta Pizza',
      imgUrl:
          'https://upload.wikimedia.org/wikipedia/commons/e/ee/Eq_it-na_pizza-margherita_sep2005_sml-2.png',
      price: 8.99),
  Product(
      id: '6',
      category: dummyCategories[1],
      name: 'Lazania',
      imgUrl:
          'https://www.pngkey.com/png/full/155-1551891_0-chicken-lasagna-pasta-png.png',
      price: 8.99),
  Product(
      id: '7',
      category: dummyCategories[1],
      name: 'Koshary',
      imgUrl:
          'https://static.wixstatic.com/media/7f9493_a6e4ce2c09dc4b1e8f878029fc18fd13~mv2.png/v1/fill/w_440,h_438,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/7f9493_a6e4ce2c09dc4b1e8f878029fc18fd13~mv2.png',
      price: 6.99),
  Product(
      id: '8',
      category: dummyCategories[3],
      name: 'Fried Chicken',
      imgUrl:
          'https://www.freepnglogos.com/uploads/fried-chicken-png/crispy-fried-chicken-png-0.png',
      price: 7.99),
  Product(
      id: '9',
      category: dummyCategories[3],
      name: 'Grilled Chicken',
      imgUrl:
          'https://static.vecteezy.com/system/resources/previews/021/665/568/original/delicious-grilled-chicken-cutout-png.png',
      price: 9.99),
];
