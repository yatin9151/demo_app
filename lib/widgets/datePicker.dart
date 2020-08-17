import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  var finalDate;
  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        finalDate = pickedDate.toString().substring(0, 11);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Center(
        child: GestureDetector(
          onTap: _presentDatePicker,
          child: Text(finalDate == null
              ? DateTime.now().toString().substring(0, 11)
              : finalDate.toString().substring(0, 11)),
        ),
      ),
    );
  }
}
