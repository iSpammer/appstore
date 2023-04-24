

import 'package:flutter/cupertino.dart';

class GenderSheetWidget extends StatelessWidget {
  const GenderSheetWidget({
    Key? key,
    required this.didTappedMale,
    required this.didTappedFemale,
    required this.didTappedCancel
  }) : super(key: key);

  final GestureTapCallback didTappedMale;
  final GestureTapCallback didTappedFemale;
  final GestureTapCallback didTappedCancel;

  @override
  Widget build(BuildContext context) => CupertinoActionSheet(
    title: Text('Gender'),
    message: Text('Select your gender'),
    actions: [
      CupertinoActionSheetAction(
          onPressed: didTappedMale,
          child: Text('male')
      ),
      CupertinoActionSheetAction(
          onPressed: didTappedFemale,
          child: Text('female')
      ),
      CupertinoActionSheetAction(
          onPressed: didTappedCancel,
          child: Text('cancel')
      )
    ],
  );
}