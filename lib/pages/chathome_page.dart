import 'package:flutter/material.dart';
import 'package:twitter_z/pages/chat_page.dart';
import 'package:twitter_z/services/chat/chat_service.dart';
import '../components/user_tile01.dart';
import '../services/auth/auth_service.dart';
import '../components/my_drawer.dart';
// import '../components/user_tile01.dart';

class ChatHomePage extends StatefulWidget {
  ChatHomePage({super.key});

  @override
  State<ChatHomePage> createState() => _ChatHomePageState();
}

class _ChatHomePageState extends State<ChatHomePage> {
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat Home"),
      ),
      drawer:  MyDrawer(),
      body: _buildUserList(),
    );
  }

  // Build a list of users except for the current logged-in user
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        // Error
        if (snapshot.hasError) {
          return const Center(child: Text("Error"));
        }
        // Loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: Text("Loading..."));
        }
        // Check if data exists
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No users found"));
        }
        // Return ListView
        final users = snapshot.data!;
        return ListView(
          children: snapshot.data!
              .map<Widget> ((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  // Build individual list tile for a user
  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
    // Display all users except the current user
    if(userData["email"] != _authService.getCurrentUser()){
      return UserTile(
        text: userData['email'], // Display user name
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverEmail: userData["email"],
                receiverID: userData["uid"],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }

}
