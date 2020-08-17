import 'package:flutter/material.dart';

class ResultsCard extends StatelessWidget {
  Widget dividerLine(double height) {
    return Divider(height: height, color: Colors.blueGrey);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: Colors.blue[100],
            padding: EdgeInsets.all(7),
            child: Column(
              children: <Widget>[
                Center(child: Text("Lot no")),
                dividerLine(3),
                SizedBox(
                  height: 50,
                ),
                Center(child: Text("Defect Details")),
                dividerLine(3),
                SizedBox(
                  height: 50,
                ),
                Center(child: Text("Size Results")),
                dividerLine(3),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
          RaisedButton(
            color: Colors.orange[200],
            onPressed: () {},
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            child: Text("Click here to check image results"),
          )
        ],
      ),
    );
  }
}
