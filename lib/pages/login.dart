import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Image.asset('lib/images/logo.png', width: 300,),
        
            //welcome back message
            Text('Welcome back, Thrilled to have you here again.')
        
            //email
        
            //password
        
            //login button
        
            //register now
          ],
        ),
      ),
    );
  }
}