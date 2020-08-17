import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  @override
  _CheckBoxWidgetState createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Checkbox(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: _rememberMe,
          onChanged: (value) {
            setState(() {
              _rememberMe = value;
            });
          }),
    );
  }
}
