

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class RoundedIconBtn extends StatelessWidget {
  final IconData iconData;
  final GestureTapCallback onTapped;

  const RoundedIconBtn({
    Key? key,
    required this.iconData,
    required this.onTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: onTapped,
        child: Icon(iconData),
      ),
    );
  }
}