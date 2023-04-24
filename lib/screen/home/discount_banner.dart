

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carisma/models/home_banner_model.dart';
import 'package:carisma/viewmodels/home_view_model.dart';
import 'package:provider/provider.dart';

import '../../size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<HomeViewModel>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(viewModel.homeBanner.discountBanners.length, (index) {
            DiscountBannerModel model = viewModel.homeBanner.discountBanners[index];

            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                    vertical: getProportionateScreenWidth(15)
                  ),
                  height: 90,
                  width: MediaQuery.of(context).size.width - 60,
                  decoration: BoxDecoration(
                    color: Color(0xFF4A3298),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text.rich(
                    TextSpan(
                      text: "${model.title}\n",
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                            text: model.value,
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
                        )
                      ]
                    )
                  ),
                ),
                onTap: () {
                  print("${model.title})}");
                },
              ),
            );
          })
        ],
      ),
    );
  }
}