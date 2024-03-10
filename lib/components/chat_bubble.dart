import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurentUser;

  const ChatBubble({super.key, required this.message, required this.isCurentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isCurentUser ? Color.fromARGB(255, 188, 206, 255) : Colors.grey[500],
      ),
      child: Text(message),
    );
  }
}