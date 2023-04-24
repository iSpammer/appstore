

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  static String routeName = "/date_picker";
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {

  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: _buildDatePicker()
      ),
    );
  }

  Widget _buildDatePicker() {
    return SizedBox(
      height: 180,
      child: CupertinoDatePicker(
        initialDateTime: _dateTime,
        mode: CupertinoDatePickerMode.date,
        onDateTimeChanged: (dateTime) {
          print(dateTime);
          setState(() {
            this._dateTime = dateTime;
          });
        },
      ),
    );
  }
}