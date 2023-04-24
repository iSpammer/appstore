

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.icon,
    required this.text,
    required this.didTapped,
  }) : super(key: key);

  final String text;
  final String icon;
  final VoidCallback didTapped;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: MaterialButton(
          padding: EdgeInsets.all(20),
          color: Color(0xFFF5F6F9),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onPressed: didTapped,
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                width: 22,
                color: kPrimaryColor,
              ),
              SizedBox(width: 20),
              Expanded(child: Text(text, style: Theme.of(context).textTheme.bodyText1)),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
      ),
    );
  }
}