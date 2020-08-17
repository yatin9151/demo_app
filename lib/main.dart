import 'package:demo_app/screens/homePage.dart';
import 'package:demo_app/screens/takeImage.dart';
import 'package:flutter/material.dart';

import './screens/authentication_Screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Great Places',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.amber,
      ),
      home: AuthenticationScreen(),
      routes: {
        HomePage.routeName: (ctx) => HomePage(),
        TakeImage.routeName: (ctx) => TakeImage(),
      },
    );
  }
}
