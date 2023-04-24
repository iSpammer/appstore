

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final GestureTapCallback onTapped;
  const SectionTitle({
    Key? key,
    required this.title,
    required this.onTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
            title,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                color: Colors.black
            )
        ),
        GestureDetector(
          child: Text("See More"),
          onTap: onTapped,
        )
      ],
    );
  }
}