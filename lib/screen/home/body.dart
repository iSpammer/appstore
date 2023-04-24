

import 'package:carisma/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carisma/models/demo_product.dart';
import 'package:carisma/models/home_banner_model.dart';
import 'package:carisma/screen/cart/cart_screen.dart';
import 'package:carisma/screen/home/product_card.dart';
import 'package:carisma/screen/home/search_bar.dart';
import 'package:carisma/screen/home/section_title.dart';
import 'package:carisma/screen/home/special_offer_card.dart';
import 'package:carisma/screen/product_detail/product_detail_screen.dart';
import 'package:carisma/size_config.dart';
import 'package:carisma/viewmodels/home_view_model.dart';
import 'package:provider/provider.dart';

import 'home_header.dart';
import 'discount_banner.dart';
import 'icon_btn_with_num.dart';

class Body extends StatefulWidget {

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<HomeViewModel>(context, listen: false).getHomeBannerInFirebase();
    Provider.of<HomeViewModel>(context, listen: false).getLandings();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<HomeViewModel>(context);

    // TODO: implement build
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20)
          ),
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(20)),
              // TODO: Home Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SearchBar(),
                  IconBtnWithNum(
                    svgSrc: "assets/icons/Cart Icon.svg",
                    numOfItems: 0,
                    onTapped: () {
                      Navigator.pushNamed(context, CartScreen.routeName);
                    }
                  ),
                  IconBtnWithNum(
                      svgSrc: "assets/icons/Bell.svg",
                      numOfItems: 3,
                      onTapped: () {
                        print("didTappedBell");
                      }
                  )
                ]
              ),
              SizedBox(height: getProportionateScreenHeight(20)),

              // TODO: Headers
              HomeHeader(models: viewModel.landings),
              SizedBox(height: getProportionateScreenHeight(20)),

              // TODO: Home Banner
              DiscountBanner(),
              SizedBox(height: getProportionateScreenHeight(20)),

              // TODO: Special of you
              SectionTitle(title: "Special for you", onTapped: () {
                print("Special for you See More");
              }),
              SizedBox(height: getProportionateScreenHeight(15)),

              CategoriesWidget(models: viewModel.homeBanner.topBanners),
              SizedBox(height: getProportionateScreenHeight(20)),

              // TODO: Popular Product
              SectionTitle(title: "Popular Product", onTapped: () {
                print("Popular Product See More");
              }),
              SizedBox(height: getProportionateScreenHeight(15)),
              Container(
                height: 500,
                child:     StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('products').snapshots(), // access the products collection
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView( // use a ListView to display multiple rows
                        children: snapshot.data!.docs.map((userDoc) { // loop through each user document
                          String userEmail = userDoc.id; // get the user email from the document id
                          return StreamBuilder<QuerySnapshot>( // use another StreamBuilder to access the subcollection of sales for each user
                            stream: FirebaseFirestore.instance.collection('products').doc(userEmail).collection('sales').snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return SingleChildScrollView( // use a SingleChildScrollView to display a horizontal row of products for each user
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: snapshot.data!.docs.map((productDoc) { // loop through each product document
                                      Product product = Product.fromMap(productDoc.id, productDoc.data() as Map<String, dynamic>);
                                      return ProductCard(product: product, onTapped: () {
                                        Navigator.pushNamed(
                                            context, ProductDetailScreen.routeName,
                                            arguments: ProductDetailArguments(product: product));
                                      });
                                    }).toList(),
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return Text('Something went wrong');
                              } else {
                                return CircularProgressIndicator();
                              }
                            },
                          );
                        }).toList(),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Something went wrong');
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ),

              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: [
              //       ...List.generate(
              //           demoProducts.length,
              //           (index) {
              //             return ProductCard(product: demoProducts[index], onTapped: () {
              //               Navigator.pushNamed(
              //                   context, ProductDetailScreen.routeName,
              //                   arguments: ProductDetailArguments(product: demoProducts[index]));
              //             });
              //           }
              //       )
              //     ],
              //   ),
              // ),
            ]
          ),
        ),
      )
    );
  }
}

class CategoriesWidget extends StatefulWidget {

  final List<TopBannerModel> models;
  const CategoriesWidget({
    Key? key, required this.models,
  }) : super(key: key);

  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {

  @override void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var viewModel = Provider.of<HomeViewModel>(context);

    Future getDownLoadUrl(String path) async {
      var result = await viewModel.getTopBannerImageInFirebase(path);
      return result;
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(widget.models.length, (index) {
            TopBannerModel model = widget.models[index];

            return FutureBuilder(
              future: getDownLoadUrl(model.imageUrl),
              builder: (BuildContext context, AsyncSnapshot snapshot) {

                switch (snapshot.connectionState) {

                  case ConnectionState.none:
                    // TODO: Handle this case.
                    return Container();

                  case ConnectionState.waiting:
                    // TODO: Handle this case.
                    return Container();

                  case ConnectionState.active:
                    // TODO: Handle this case.
                    return Container();

                  case ConnectionState.done:
                    // TODO: Handle this case.
                    return SpecialOfferCard(
                        category: model.category,
                        imageSrc: snapshot.data.toString(),
                        numOfBrands: model.numOfBrand,
                        onTapped: () {

                        }
                    );
                }
              },
            );
          }),
        ],
      ),
    );
  }
}





