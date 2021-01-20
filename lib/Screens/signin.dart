import 'package:StudyPlanner/Screens/models/authmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/authmodel.dart';
import 'services/loginservice.dart';

//import '../Screens/InputDeco_design.dart';

class SignInScreen extends StatefulWidget {
  @override
  SignInScreenState createState() => SignInScreenState();
}

InputDecoration txtDecoration(var str) {
  return InputDecoration(hintText: str);
}

class SignInScreenState extends State<SignInScreen> {
  final _bottomSpace = 10.0;
  final _formKey = GlobalKey<FormState>();
  final emailExp =
      new RegExp(r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)");
  final passTxtController = TextEditingController();
  final emailTxtController = TextEditingController();
  //String errMsg = "";

  @override
  void dispose() {
    passTxtController.dispose();
    emailTxtController.dispose();
    super.dispose();
  }

  _login() async {
    if (_formKey.currentState.validate()) {
      String email = emailTxtController.text;
      String password = passTxtController.text;

      var loginRes = await authenticate(email, password);

      if (loginRes.errMsg == null) {
        Provider.of<AuthModel>(context, listen: false).login(loginRes.token);
        
        Navigator.pushNamedAndRemoveUntil(
            context, 'Home', (Route<dynamic> route) => false);
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(
          '${loginRes.errMsg}',
          style: TextStyle(color: Colors.red),
        )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          SizedBox(height: 200),
          TextFormField(
              controller: emailTxtController,
              decoration: txtDecoration('Email'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter your Email';
                }
                return null;
              }),
          SizedBox(height: 30),
          TextFormField(
              obscureText: true,
              decoration: txtDecoration('Password'),
              controller: passTxtController,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter your password';
                }

                return null;
              }),
          SizedBox(height: 70),
          ElevatedButton(
              child: Text('Login'),
              //_login method
              onPressed: _login),
          SizedBox(height: 50),
          Text('Don\'t have an account?',
              style: TextStyle(color: Colors.white)),
          ElevatedButton(
              child: Text('Register Now'),
              onPressed: () {
                Navigator.pushNamed(context, 'SignUp');
              }),
        ]) //Column

        ); //Form
  }
}
