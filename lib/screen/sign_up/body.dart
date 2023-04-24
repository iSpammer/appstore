

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carisma/constants.dart';
import 'package:carisma/screen/sign_up/sign_up_form.dart';
import 'package:carisma/size_config.dart';
import 'package:carisma/viewmodels/sign_up_view_model.dart';
import 'package:carisma/widget/social_card.dart';
import 'package:provider/provider.dart';

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
                Text("Register Account", style: headingStyle),
                Text(
                  "Complete your details or continue \nwith social media",
                  textAlign:TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                        iconString: "assets/icons/facebook-2.svg",
                        didTapped: () {}
                    ),
                    SocialCard(
                        iconString: "assets/icons/google-icon.svg",
                        didTapped: () {}
                    ),
                    SocialCard(
                        iconString: "assets/icons/twitter.svg",
                        didTapped: () {}
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  "By continuing your confirm that you agree \nwith out Term and Condition",
                  textAlign: TextAlign.center
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



