import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twitter_z/components/chat_bubble.dart';
import 'package:twitter_z/components/my_text_field.dart';
import 'package:twitter_z/services/auth/auth_service.dart';
import 'package:twitter_z/services/chat/chat_service.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;

  // Constructor for ChatPage
  ChatPage({
    super.key,
    required this.receiverEmail,
    required this.receiverID,
  });

  // Text controller
  final TextEditingController _messageController = TextEditingController();

  // Chat & auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  // Send message function
  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      // Send the message
      await _chatService.sendMessage(receiverID, _messageController.text);
      // Clear the text field after sending
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(receiverEmail)),
      body: Column(
        children: [
          // Display all messages
          Expanded(
            child: _buildMessageList(),
          ),

          // User input (message text field)
          _buildUserInput(),
        ],
      ),
    );
  }

  // Build message list
  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessages(receiverID, senderID),
      builder: (context, snapshot) {
        // Error handling
        if (snapshot.hasError) {
          return const Text("Error");
        }
        // Loading state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }
        // Return list view of messages
        return ListView(
          children: snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
      },
    );
  }

  // Build message item
  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // Xác định xem tin nhắn là của người dùng hiện tại hay không
    bool isCurrentUser = data['senderID'] == _authService.getCurrentUser()!.uid;

    return Align(
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: ChatBubble(
        message: data["message"],
        isCurrentUser: isCurrentUser,
      ),
    );
  }


  // Build user input field
  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          // TextField should take up most of the space
          Expanded(
            child: MyTextField(
              controller: _messageController,
              hintText: "Type a message",
              obscureText: false,
            ),
          ),
          // Send button
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            margin: const EdgeInsets.only(left: 8),
            child: IconButton(
              onPressed: sendMessage,
              icon: const Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
