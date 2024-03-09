import 'package:flutter/material.dart';
import 'package:whispr/components/button.dart';
import 'package:whispr/components/textfield.dart';

class RegisterPage extends StatelessWidget {
  //email and password controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController = TextEditingController();


  RegisterPage({super.key});

  //register method
  void register(){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80,),
              //logo
              Image.asset(
                'lib/images/logo.png',
                width: 300,
              ),

              const SizedBox(height: 40,),

              //welcome back message
              Text(
                "Let's create an account for you",
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

              const SizedBox(height: 16,),

              //confirm password
              CustomTextField(
                hintText: 'Confirm Password',
                obscureText: true,
                controller: _passwordConfirmController,
              ),

              const SizedBox(height: 20,),

              //login button
              Button(
                text: 'Register',
                onTap: register,
              ),

              const SizedBox(height: 20,),

              //register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  Text(
                    'Login now',
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