import 'package:flutter/material.dart';
import 'package:whispr/services/auth/auth_service.dart';
import 'package:whispr/services/chat/chat_service.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;

  ChatPage({super.key, required this.receiverEmail});

  //text controller
  final TextEditingController _messageController = TextEditingController();

  //chat and auth service
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverEmail),
      ),
    );
  }
}