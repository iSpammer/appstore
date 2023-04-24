import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carisma/constants.dart';
import 'package:carisma/models/product.dart';
import 'package:carisma/screen/product_detail/product_image.dart';
import 'package:carisma/screen/product_detail/rounded_icon_btn.dart';
import 'package:carisma/size_config.dart';
import 'package:carisma/widget/default_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'color_dots.dart';

class Body extends StatelessWidget {

  final Product product;
  Body({required this.product});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        ProductImage(product: product),

        // TODO: DESC
        Container(
          padding: EdgeInsets.only(top: getProportionateScreenWidth(20)),
          margin: EdgeInsets.only(top: getProportionateScreenWidth(20)),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), 
              topRight: Radius.circular(40)
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // TODO: Product Title
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                child: Text(product.title, style: Theme.of(context).textTheme.headline6),
              ),

              // TODO: Right Like Button
              Align(  // 相對定位
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                  width: getProportionateScreenWidth(64),
                  // decoration: BoxDecoration(
                  //   color: product.isFavourite ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
                  //   borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(20),
                  //     bottomLeft: Radius.circular(20)
                  //   )
                  // ),
                  // child: SvgPicture.asset(
                  //   "assets/icons/Heart Icon_2.svg",
                  //   color: product.isFavourite ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
                  // ),
                ),
              ),

              // TODO: Product Desc
              Padding(
                padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(20),
                  right: getProportionateScreenWidth(64)
                ),
                child: Text(
                  product.description,
                  maxLines: 3,
                )
              ),

              // TODO: See More Detail
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: 10
                ),
                child: GestureDetector(
                  onTap: () {
                    print("Did Tapped See More");
                  },
                  child: Row(
                    children: [
                      Text(
                        "See More Detail",
                        style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_forward_ios, size: 12, color: kPrimaryColor)
                    ]
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: getProportionateScreenHeight(20)),

        // TODO: Color Choose & Add Remove Icon
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Row(
            children: [
              ColorDots(product: product),
              Spacer(),
              RoundedIconBtn(
                iconData: Icons.remove,
                onTapped: () {
                  print("-");
                },
              ),
              RoundedIconBtn(
                iconData: Icons.add,
                onTapped: () {
                  print("+");
                }
              )
            ]
          )
        ),

        // TODO: Add to Cart Button
        Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.screenWidth * 0.15,
            right: SizeConfig.screenWidth * 0.15, 
            top: getProportionateScreenWidth(40),
            bottom: getProportionateScreenWidth(40)
          ),
          child: Container(
            child: DefaultButton(
              text: "Add to Cart",
              onTapped: () {
                print("Add to Cart");
              }
            ),
          ),
        )
      ]
    );
  }
}

