import 'package:flutter/material.dart';
import 'package:whispr/components/textfield.dart';

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
            Text('Welcome back, Thrilled to have you here again.', style: TextStyle(fontSize: 16, color: Colors.grey[600]),),

            const SizedBox(height: 16,),
        
            //email
            CustomTextField(),
        
            //password
        
            //login button
        
            //register now
          ],
        ),
      ),
    );
  }
}