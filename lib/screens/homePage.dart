import 'package:flutter/material.dart';

import '../screens/takeImage.dart';
import '../widgets/cardBuilder.dart';
import '../widgets/resultsCard.dart';
import '../widgets/datePicker.dart';
import '../widgets/commodities_listView.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/homePage';

  @override
  Widget build(BuildContext context) {
    Widget dividerLine(double height) {
      return Divider(height: height, color: Colors.blueGrey);
    }

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: const Text('Logo'),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    DatePicker(),
                    dividerLine(0),
                    CommoditiesListView(),
                    dividerLine(0),
                    CardBuilder(),
                    dividerLine(5),
                    ResultsCard(),
                  ],
                ),
              ),
            ),
            RaisedButton.icon(
              label: const Text("Take Image"),
              icon: Icon(Icons.add),
              color: Theme.of(context).accentColor,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              elevation: 0,
              onPressed: () {
                Navigator.of(context).pushNamed(TakeImage.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
