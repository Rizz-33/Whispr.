import 'package:flutter/material.dart';
import 'package:whispr/pages/login.dart';
import 'package:whispr/pages/register.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginOrRegister> {

  //initially show login page
  bool showLoginPage = true;

  //toggle between login and register page
  void togglePages(){
    setState(() {
      showLoginPage= !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      return LoginPage();
    } else {
      return RegisterPage();
    }
  }
}