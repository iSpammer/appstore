

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carisma/models/product.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';
import '../../size_config.dart';

class ProductCard extends StatelessWidget {
  final double width;
  final double aspectRatio;
  final Product product;
  final GestureTapCallback onTapped;

  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRatio = 1.0,
    required this.product,
    required this.onTapped
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: onTapped,
        child: SizedBox(
          width: getProportionateScreenWidth(width),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: aspectRatio,
                child: Container(
                  decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Image.network(product.images[0]),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                product.title,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        fontWeight: FontWeight.w600,
                        color: kPrimaryColor
                    ),
                  ),

                  InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {

                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(8),
                      width: getProportionateScreenWidth(28),
                      height: getProportionateScreenWidth(28),
                      // decoration: BoxDecoration(
                      //     color: product.isFavourite ? kPrimaryColor.withOpacity(0.15) :
                      //     kSecondaryColor.withOpacity(0.1),
                      //     shape: BoxShape.circle
                      // ),
                      // child: SvgPicture.asset(
                      //     "assets/icons/Heart Icon_2.svg",
                      //     color: product.isFavourite ? Color(0xFFFF4848) : Color(0xFFDBDEE4)
                      // ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}