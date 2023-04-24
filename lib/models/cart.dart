

import 'package:carisma/models/demo_product.dart';
import 'package:carisma/models/product.dart';

class Cart {
  final Product product;
  final int numOfItems;

  Cart({required this.product, required this.numOfItems});
}

// // DEMO data for cart
// List<Cart> demoCarts = [
//   Cart(product: demoProducts[0], numOfItems: 3),
//   Cart(product: demoProducts[1], numOfItems: 5),
//   Cart(product: demoProducts[2], numOfItems: 4)
// ];