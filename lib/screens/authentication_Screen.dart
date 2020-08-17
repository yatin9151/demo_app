import 'package:flutter/material.dart';

import 'package:demo_app/widgets/checkBox.dart';
import 'package:demo_app/screens/homePage.dart';

class AuthenticationScreen extends StatelessWidget {
  static const routeName = '/authenticationScreen';

  @override
  Widget build(BuildContext context) {
    final _userIdController = TextEditingController();
    final _passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Intello Labs"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Center(
                child: const Text(
                  'Login Page',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Divider(
                thickness: 2,
              ),
              TextField(
                controller: _userIdController,
                decoration: InputDecoration(
                  labelText: 'User Id',
                  labelStyle: TextStyle(fontSize: 15),
                ),
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    CheckBoxWidget(),
                    Text('Remember me'),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.indigo[600]),
                ),
                color: Colors.amber[200],
                splashColor: Theme.of(context).accentColor,
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(HomePage.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
