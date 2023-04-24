

import 'package:flutter/cupertino.dart';

class Utils {

  static void showSheet({
    required BuildContext context,
    required Widget child,
    required VoidCallback onTapped
  }) => showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          child
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text('Done'),
          onPressed: onTapped
        ),

      )
  );
}