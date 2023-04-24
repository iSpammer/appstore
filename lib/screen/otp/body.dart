

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carisma/constants.dart';
import 'package:carisma/size_config.dart';

import 'opt_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                Text("OTP Verification", style: headingStyle),
                Text("We sent your code to +1 898 860 ***"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("This code will expired in "),
                    TweenAnimationBuilder<double>(
                      tween: Tween(begin: 30.0, end: 0.0),
                      duration: Duration(seconds: 30),
                      builder: (_, value, child) {
                        return Text(
                          "00:${value.toInt()}",
                          style: TextStyle(color: kPrimaryColor),
                        );
                      },
                      onEnd: () {
                        // Do Something
                      },
                    ),
                  ]
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.15),
                OtpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.1),
                GestureDetector(
                  child: Text(
                    "Resend OTP Code",
                    style: TextStyle(decoration: TextDecoration.underline)
                  ),
                  onTap: () {

                  },
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}