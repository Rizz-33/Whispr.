import 'package:flutter/material.dart';
import 'package:whispr/components/button.dart';
import 'package:whispr/components/textfield.dart';
import 'package:whispr/services/auth/auth_service.dart';

class LoginPage extends StatelessWidget {
  //email and password controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //tap to go to register page
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  //login method
  void login(BuildContext context) async {
    //auth service
    final authService = AuthService();

    //try log in
    try {
      await authService.signInWithEmailPassword(_emailController.text, _passwordController.text,);
    }

    //catch any errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 130,),
              //logo
              Image.asset(
                'lib/images/logo.png',
                width: 300,
              ),

              const SizedBox(height: 40,),

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
                onTap: () => login(context),
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
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      'Register now',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
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
