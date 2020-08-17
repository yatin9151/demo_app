import 'package:flutter/material.dart';

class CardBuilder extends StatefulWidget {
  @override
  _CardBuilderState createState() => _CardBuilderState();
}

class _CardBuilderState extends State<CardBuilder> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: _isExpanded
          ? 200
          : 60, // Max length can be set according to length of items
      duration: Duration(milliseconds: 150),
      child: Card(
          color: Colors.blue[100],
          child: ListTile(
            leading: Text(
              "Lot no:",
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            trailing: IconButton(
                icon: _isExpanded
                    ? Icon(Icons.expand_less)
                    : Icon(Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                    print("true");
                  });
                }),
          )),
    );
  }
}
