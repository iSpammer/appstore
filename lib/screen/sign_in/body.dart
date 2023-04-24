
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carisma/screen/sign_in/sign_form.dart';
import 'package:carisma/size_config.dart';
import 'package:carisma/widget/no_account_text.dart';
import 'package:carisma/widget/social_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          // 水平 垂直間距
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Welcome Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold
                  )
                ),
                Text("Sign in with your email and password \nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
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
                NoAccountText()
              ]
            ),
          ),
        ),
      )
    );
  }
}

