

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carisma/models/cart.dart';
import 'package:carisma/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/product.dart';
import 'cart_item.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      // TODO: replace the email with the curr user email
      future: FirebaseFirestore.instance.collection('users').doc("ispamossama@gmail.comm").get(), // get the user document
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<String> cart = List<String>.from(snapshot.data!.get('cart')); // get the cart field as a list of strings
          return FutureBuilder<List<Product>>( // use another FutureBuilder to get the list of products from the cart
            future: getCartProducts(cart), // a method that returns a list of products from a list of strings
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Product> products = snapshot.data!; // get the list of products
                return ListView.builder( // use a ListView.builder to display each product in the cart
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    Product product = products[index]; // get the product at the index
                    return CartItem( // use a ProductCard widget to display the product details
                      cart: Cart(product: product, numOfItems: 1),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('Something went wrong');
              } else {
                return CircularProgressIndicator();
              }
            },
          );
        } else if (snapshot.hasError) {
          return Text('Something went wrong');
        } else {
          return CircularProgressIndicator();
        }
      },
    );

    // return Padding(
    //   padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
    //   child: ListView.builder(
    //     itemCount: demoCarts.length,
    //     itemBuilder: (context, index) {
    //       return Padding(
    //         padding: EdgeInsets.symmetric(vertical: 10),
    //         child: Dismissible(
    //             key: Key(demoCarts[0].product.id.toString()),
    //             direction: DismissDirection.endToStart,
    //             onDismissed: (direction) {
    //               // 刪除後的 call back
    //               demoCarts.removeAt(index);
    //               print("remove");
    //             },
    //             background: Container(
    //               padding: EdgeInsets.symmetric(horizontal: 20),
    //               decoration: BoxDecoration(
    //                   color: Color(0xFFFFE6E6),
    //                   borderRadius: BorderRadius.circular(15)
    //               ),
    //               child: Row(
    //                 children: [
    //                   Spacer(),
    //                   SvgPicture.asset("assets/icons/Trash.svg")
    //                 ],
    //               ),
    //             ),
    //             child: CartItem(cart: demoCarts[index])
    //         ),
    //       );
    //     }
    //   ),
    // );
  }
  Future<List<Product>> getCartProducts(List<String> cart) async {
    List<Product> products = []; // an empty list of products
    for (String item in cart) { // loop through each item in the cart
      List<String> parts = item.split("/"); // split the item by "/" to get the seller's email, collection name, and product id
      String sellerEmail = parts[0]; // get the seller's email
      String collectionName = parts[1]; // get the collection name
      String productId = parts[2]; // get the product id
      DocumentSnapshot productDoc = await FirebaseFirestore.instance.collection('products').doc(sellerEmail).collection(collectionName).doc(productId).get(); // get the product document from Firestore
      Product product = Product.fromMap(productId, productDoc.data() as Map<String, dynamic>); // convert the product document data to a Product object
      products.add(product); // add the Product object to the list of products
    }
    return products; // return the list of products
  }
}

