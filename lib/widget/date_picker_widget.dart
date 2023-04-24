

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatefulWidget {

  void Function(String) callback;
  DatePickerWidget(this.callback);

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {

  @override
  Widget build(BuildContext context) {

    String birthday = DateFormat('yyyy-MM-dd').format(DateTime.now());

    return CupertinoActionSheet(
      actions: [
        SizedBox(
          height: 180,
          child: CupertinoDatePicker(
            initialDateTime: DateTime.now(),
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (dateTime) {
              birthday = DateFormat('yyyy-MM-dd').format(dateTime);
            },
          ),
        )
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text('Done'),
        onPressed: () {
          widget.callback(birthday);
          Navigator.pop(context);
        },
      ),
    );
  }
}