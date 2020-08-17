import 'package:demo_app/widgets/commodities_listView.dart';
import 'package:demo_app/widgets/datePicker.dart';
import 'package:flutter/material.dart';
import '../widgets/takeImage_item.dart';

class TakeImage extends StatefulWidget {
  static const routeName = '/takeImage';
  @override
  _TakeImageState createState() => _TakeImageState();
}

class _TakeImageState extends State<TakeImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: null,
            icon: Icon(Icons.laptop),
            label: Text(""),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: <Widget>[
            DatePicker(),
            Divider(
              color: Colors.blueGrey,
              thickness: 1,
              height: 0,
            ),
            CommoditiesListView(),
            Divider(
              color: Colors.blueGrey,
              thickness: 1,
              height: 0,
            ),
            TakeImageItem(),
          ],
        )),
      ),
    );
  }
}
