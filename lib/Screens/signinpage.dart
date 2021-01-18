import 'package:StudyPlanner/Screens/signin.dart';
import 'package:flutter/material.dart';
import 'signin.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.white,
        appBar: AppBar(title: Text('Login'), backgroundColor: Colors.blue[900]),
        body: Stack(children: <Widget>[
          //SizedBox(height: 1000),
          Padding(
            padding: EdgeInsets.only(top: 100.0, left: 20, bottom: 100),
            child: Text(
              'Welcome Back!',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue[900],
                  fontWeight: FontWeight.bold),
            ),
          ),
          //SizedBox(height: 100),
          SingleChildScrollView(
              child: Container(
                  child: SignInScreen(),
                  padding: EdgeInsets.all(12)) //Container
              ) //SingleChildScrollView
        ]));
  }
}
