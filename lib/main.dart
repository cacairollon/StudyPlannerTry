import 'package:StudyPlanner/Screens/signinpage.dart';
import 'package:StudyPlanner/Screens/signuppage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/homescreen.dart';
import 'Screens/models/authmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthModel(),
      child: MaterialApp(
        title: 'Sign Up Screen ',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: 'SignIn',
        routes: {
          'SignIn': (context) => SignInPage(),
          'SignUp': (context) => SignUpPage(),
          'Home': (context) => HomeScreen(),
          //'SignInScreen': (context) => SignInPage(),
        },
      ),
    );
  }
}
