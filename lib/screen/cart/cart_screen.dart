import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carisma/models/cart.dart';
import 'package:carisma/screen/cart/body.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // import the firebase_auth package

import 'checkout_bottom.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "";

  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Text("Your Cart", style: TextStyle(color: Colors.black)),
              FutureBuilder<int>( // use a FutureBuilder to get the length of the cart
                future: getCartLength(), // a method that returns the length of the cart for the current user
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text("${snapshot.data} items", style: Theme.of(context).textTheme.caption); // display the length of the cart
                  } else if (snapshot.hasError) {
                    return Text('Something went wrong');
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
        body: Body(),
        bottomNavigationBar: CheckoutBottom());
  }

  // A method that returns the length of the cart for the current user
  Future<int> getCartLength() async {
    User? user = FirebaseAuth.instance.currentUser; // get the current user object
    if (user != null) { // check if the user is not null
      String userEmail = user.email!; // get the user email from the user object
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(userEmail).get(); // get the user document
      List<String> cart = List<String>.from(userDoc.get('cart')); // get the cart field as a list of strings
      return cart.length; // return the length of the cart
    } else {
      throw Exception('No user logged in'); // throw an exception if there is no user logged in
    }
  }
}
