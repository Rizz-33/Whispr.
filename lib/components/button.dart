import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;

  const Button({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8)
      ),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: Center(
        child: Text(text),
      ),
    );
  }
}