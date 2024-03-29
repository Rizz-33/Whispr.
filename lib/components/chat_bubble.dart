import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whispr/themes/thteme_provider.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurentUser;

  const ChatBubble({super.key, required this.message, required this.isCurentUser});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    return Container(
      decoration: BoxDecoration(
        color: isCurentUser
        ? (isDarkMode ? Color.fromARGB(99, 80, 123, 232) : Color.fromARGB(200, 0, 47, 167))
        : (isDarkMode ? Colors.grey[900]: Colors.grey[300] ),
        borderRadius: BorderRadius.circular(16)
      ),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Text(
        message,
        style: TextStyle(
          color: isCurentUser
            ? Colors.white
            : (isDarkMode ? Colors.white : Colors.black)),
      ),
    );
  }
}