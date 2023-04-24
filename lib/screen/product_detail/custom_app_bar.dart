import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carisma/screen/product_detail/rounded_icon_btn.dart';
import 'package:flutter_svg/svg.dart';

import '../../size_config.dart';


// TODO: Custom App Bar
class CustomAppBar extends PreferredSize {

  final double rating;

  CustomAppBar({required this.rating}) : super(
      preferredSize: Size.fromHeight(AppBar().preferredSize.height),
      child: Container()
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RoundedIconBtn(iconData: Icons.arrow_back_ios, onTapped: () {
                Navigator.pop(context);
              }),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 5),

                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(14)
                ),
                child: Row(
                  children: [
                    Text(rating.toString(), style: TextStyle(fontWeight: FontWeight.w600)),
                    SvgPicture.asset("assets/icons/Star Icon.svg")
                  ],
                ),
              )
            ]
        ),
      ),
    );
  }
}