import 'package:flutter/material.dart';
import 'package:whispr/components/drawer.dart';
import 'package:whispr/components/userTile.dart';
import 'package:whispr/pages/chat.dart';
import 'package:whispr/services/auth/auth_service.dart';
import 'package:whispr/services/chat/chat_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //chat and auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: CustomDrawer(),
      body: _buildUserList(),
    );
  }

  //build a list of users except for the current logged in user
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot){
        //error
        if (snapshot.hasError) {
          return const Text('Error');
        }


        //loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }


        //return list view
        return ListView(
          children: snapshot.data!.map<Widget>((userData) => _buildUserListItem(userData, context)).toList(),
        );
        
      },
    );
  }


  //build individual list tile for user
  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
    //display users except the current user
    if (userData['email'] != _authService.getCurrentUser()!.email) {
  return UserTile(
    text: userData['email'],
    onTap: () {
      //tapped on a user -> go to chat
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatPage(receiverEmail: userData['email'],),
        )
      );
    },
  );
} else {
  return Container();
}
  }
}
