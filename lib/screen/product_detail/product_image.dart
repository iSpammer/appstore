import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carisma/models/product.dart';

import '../../constants.dart';
import '../../size_config.dart';

class ProductImage extends StatefulWidget {

  const ProductImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _ProductImageState createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.network(widget.product.images[selectedIndex]),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
                widget.product.images.length,
                    (index) => buildSmallImage(index)
            )
          ],
        )
      ],
    );
  }

  GestureDetector buildSmallImage(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: getProportionateScreenWidth(15)),
        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: selectedIndex == index ? kPrimaryColor : Colors.white
          ),
        ),
        child: Image.network(widget.product.images[index]),
      ),
    );
  }
}