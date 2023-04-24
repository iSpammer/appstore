import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carisma/screen/home/home_screen.dart';
import 'package:carisma/screen/profile/profile_screen.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';
import '../../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color isActiveColor = Color(0xFFB6B6B6);
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40)
            ),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, -15),
                  blurRadius: 20,
                  color: Color(0xFFDADADA).withOpacity(0.15)
              )
            ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                icon: SvgPicture.asset(
                    "assets/icons/Shop Icon.svg",
                    color: selectedMenu == MenuState.home ? kPrimaryColor : isActiveColor
                ),
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                }
            ),
            IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Heart Icon.svg",
                  color: selectedMenu == MenuState.favourite ? kPrimaryColor : isActiveColor,
                ),
                onPressed: () {
                }
            ),
            IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Chat bubble Icon.svg",
                  color: selectedMenu == MenuState.message ? kPrimaryColor : isActiveColor,
                ),
                onPressed: () {
                }
            ),
            IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/User Icon.svg",
                  color: selectedMenu == MenuState.profile ? kPrimaryColor : isActiveColor,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, ProfileScreen.routeName);
                }
            ),
          ],
        ),
      ),
    );
  }
}