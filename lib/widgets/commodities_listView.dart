import 'package:flutter/material.dart';

class CommoditiesListView extends StatefulWidget {
  @override
  _CommoditiesListViewState createState() => _CommoditiesListViewState();
}

class _CommoditiesListViewState extends State<CommoditiesListView> {
  String _value;
  final commodities = [
    ' ',
    'apple',
    'tomato',
    'potato',
    'onion',
    'papaya',
    'Guava',
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("All Commodities :"),
          SizedBox(
            width: 7,
          ),
          DropdownButton(
            elevation: 9,
            value: _value,
            items: commodities.map((commodity) {
              return DropdownMenuItem(
                value: commodity,
                child: Text(commodity),
              );
            }).toList(),
            onChanged: (String value) {
              setState(() {
                _value = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
