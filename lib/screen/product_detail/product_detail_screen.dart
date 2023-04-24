
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carisma/models/product.dart';
import 'package:carisma/screen/product_detail/body.dart';
import 'custom_app_bar.dart';

class ProductDetailScreen extends StatelessWidget {
  static String routeName = "/productDetails";

  @override
  Widget build(BuildContext context) {
    final ProductDetailArguments arguments = ModalRoute.of(context)!.settings.arguments as ProductDetailArguments;

    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(rating: arguments.product.rating!),
      body: Body(product: arguments.product),

    );
  }
}

// TODO: Use arguments class to pass product to product detail screen
class ProductDetailArguments {
  final Product product;
  ProductDetailArguments({required this.product});
}