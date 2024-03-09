import 'package:flutter/material.dart';

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
    return const Placeholder();
  }
}