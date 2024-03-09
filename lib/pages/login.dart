import 'package:flutter/material.dart';
import 'package:whispr/components/button.dart';
import 'package:whispr/components/textfield.dart';

class LoginPage extends StatelessWidget {
  //email and password controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  //login method
  void login() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Image.asset(
                'lib/images/logo.png',
                width: 300,
              ),

              //welcome back message
              Text(
                'Welcome back, Thrilled to have you here again.',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),

              const SizedBox(height: 20,),

              //email
              CustomTextField(
                hintText: 'Email',
                obscureText: false,
                controller: _emailController,
              ),

              const SizedBox(height: 16,),

              //password
              CustomTextField(
                hintText: 'Password',
                obscureText: true,
                controller: _passwordController,
              ),

              const SizedBox(height: 20,),

              //login button
              Button(
                text: 'Login',
                onTap: login,
              ),

              const SizedBox(height: 20,),

              //register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member? ',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  Text(
                    'Register now',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
