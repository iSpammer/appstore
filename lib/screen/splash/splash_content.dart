
import 'package:flutter/cupertino.dart';

import '../../constants.dart';
import '../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.imageName,
    required this.text
  }) : super(key: key);
  final String imageName, text;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Spacer(),
          Text(
            'TOKOTO',
            style: TextStyle(
                fontSize: getProportionateScreenWidth(36),
                color: kPrimaryColor,
                fontWeight: FontWeight.bold
            ),
          ),
          Text(text,
            textAlign: TextAlign.center,
          ),
          Spacer(flex: 2),
          Image.asset(
            imageName,
            height: 265,
            width: 235,
          )
        ]
    );
  }
}