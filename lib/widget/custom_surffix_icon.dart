

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../size_config.dart';

class CustomSurffix extends StatelessWidget {
  const CustomSurffix({
    Key? key,
    required this.svgIcon
  }) : super(key: key);

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // 間距 左右上下
      padding: EdgeInsets.fromLTRB(
          0,
          getProportionateScreenWidth(20),
          getProportionateScreenWidth(20),
          getProportionateScreenWidth(20)
      ),
      child: SvgPicture.asset(
          svgIcon,
          height: getProportionateScreenWidth(18)
      ),
    );
  }
}