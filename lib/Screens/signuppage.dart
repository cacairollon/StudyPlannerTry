import 'package:flutter/material.dart';
import 'signup.dart';
//import 'package:gradient_app_bar/gradient_app_bar.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text('Sign Up'), backgroundColor: Colors.blue[900]),
        body: Stack(children: [
          Padding(
            padding: EdgeInsets.only(top: 100.0, left: 20, bottom: 100),
            child: Text(
              'Welcome User!',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue[900],
                  fontWeight: FontWeight.bold),
            ),
          ), //Container
          SingleChildScrollView(
              child: Container(
                  child: SignUpScreen(),
                  padding: EdgeInsets.all(12)) //Container
              ) //SingleChildScrollView
        ]));
  }
}
