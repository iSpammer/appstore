
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carisma/screen/sign_in/sign_in_screen.dart';
import 'package:carisma/screen/splash/splash_content.dart';
import 'package:carisma/widget/default_button.dart';
import 'package:carisma/constants.dart';

import '../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashMapList = [
    {
      "text": "Welcome to Tokoto, Let’s shop!",
      "imageName": "assets/images/splash_1.png"
    },
    {
      "text": "We help people conect with store \naround United State of America",
      "imageName": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "imageName": "assets/images/splash_3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value%3;
                  });
                },
                itemBuilder: (context, index) {
                  return SplashContent(
                    imageName: splashMapList[index%3]["imageName"] ?? 'assets/images/splash_1.png',
                    text: splashMapList[index%3]["text"] ?? 'Welcome to Tokoto, Let’s shop!',
                  );
                }
              ),
              flex: 3,
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(  // 水平間距
                    horizontal: getProportionateScreenWidth(20)
                ),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashMapList.length,
                        (index) => buildDot(index)
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "Continue",
                      onTapped: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                    Spacer()
                  ]
                ),
              )
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3)
      )
    );
  }
}