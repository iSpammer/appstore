
import 'package:flutter/cupertino.dart';
import 'package:carisma/models/landing_model.dart';

import 'landing_icon_widget.dart';

class HomeHeader extends StatelessWidget {

  final List<LandingModel> models;

  const HomeHeader({
    Key? key,
    required this.models
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(
            models.length,
                (index) => LandingIconWidget(
                iconSrc: models[index].iconPath,
                iconText: models[index].text,
                onTapped: () {
                  print("didTapped${models[index].clickThrough}");
                }
            )
        )
      ],
    );
  }
}