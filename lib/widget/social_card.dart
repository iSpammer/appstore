

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../size_config.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    required this.iconString,
    required this.didTapped,
    Key? key,
  }) : super(key: key);

  final String iconString;
  final Function didTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: didTapped(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        padding: EdgeInsets.all(getProportionateScreenWidth(12)),
        height: getProportionateScreenHeight(40),
        width: getProportionateScreenWidth(40),
        decoration: BoxDecoration(
            color: Color(0xFFF5F6F9),
            shape: BoxShape.circle
        ),
        child: SvgPicture.asset(iconString),
      ),
    );
  }
}