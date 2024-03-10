import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whispr/components/chat_bubble.dart';
import 'package:whispr/components/textfield.dart';
import 'package:whispr/services/auth/auth_service.dart';
import 'package:whispr/services/chat/chat_service.dart';


class ChatPage extends StatefulWidget {
  final String receiverEmail;
  final String receiverID;

  ChatPage({super.key, required this.receiverEmail, required this.receiverID});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //text controller
  final TextEditingController _messageController = TextEditingController();

  //chat and auth service
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  //for textfield focus
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    //add listener to focus node
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        //cause a delay so that the keuboard has time to show up

        //amount of remaining space will be calculated

        //scroll down

        Future.delayed(Duration(microseconds: 500), () => scrollDown(),);
      }
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    _messageController.dispose();
    super.dispose();
  }

  //scroll controller
  final ScrollController _scrollController = ScrollController();

  
  //send message
  void sendMessage() async {
    //if there is something inside the textfield
    if (_messageController.text.isNotEmpty) {
      //send the message
      await _chatService.sendMessage(widget.receiverID, _messageController.text);

      //clear text controller
      _messageController.clear();

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(widget.receiverEmail),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      body: Column(
        children: [
          //display all messages
          Expanded(
            child: _buildMessageList(),
          ),

          //user input
          _buildUserInput(),
        ],
      ),
    );
  }

  //build message list
  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessage(widget.receiverID, senderID),
      builder: (context, snapshot) {
        //errors
        if (snapshot.hasError) {
          return const Text('Error');
        }

        //loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }

        //list view
        return ListView(
          children: snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
      });
  }

  //build message item
  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    //is current user
    bool isCurentUser = data['senderID'] == _authService.getCurrentUser()!.uid;

    // align message to the right id the sender is the current user, otherwise left
    var alignment = isCurentUser ? Alignment.centerRight : Alignment.centerLeft;


    return Container(child: Column(
      crossAxisAlignment: isCurentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        ChatBubble(message: data["message"], isCurentUser: isCurentUser,)
      ],
    ));
  }

  //build input
  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Row(
        children: [
          //textfield
          Expanded(
            child: CustomTextField(
              hintText: "Type a message",
              obscureText: false,
              controller: _messageController
            ),
          ),
      
          //send button
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 0, 47, 167),
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.only(right: 16),
            child: IconButton(onPressed: sendMessage, icon: Icon(Icons.arrow_upward, color: Colors.white,),)),
        ],
      ),
    );
  }
}