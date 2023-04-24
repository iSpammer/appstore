

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAccountCell extends StatelessWidget {
  const MyAccountCell({
    Key? key,
    required this.title,
    required this.value,
    required this.didTapped,
  }) : super(key: key);

  final String title;
  final String value;
  final GestureTapCallback didTapped;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: didTapped,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 14
                ),
              ),
              Spacer(),
              Text(
                value,
                style: TextStyle(
                    fontSize: 14
                ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.arrow_forward_ios,
                size: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}