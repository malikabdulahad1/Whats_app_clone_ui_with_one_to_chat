import 'package:flutter/material.dart';
import 'package:whatsapp_clon/Models/chatModel.dart';
import 'package:whatsapp_clon/customUi/customcard.dart';
import 'package:whatsapp_clon/whatsapp_Screens/LoginScreen.dart';

class ChatScreen extends StatefulWidget {
   ChatScreen({Key? key, this.chatModels, this.sourceChat}) : super(key: key);
   
    final List<ChatModel>? chatModels;
     final ChatModel? sourceChat;




  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: ListView.builder(
      itemCount: Chat.length,
      itemBuilder: (context, index) {
      return CustomCard(chatModel: Chat[index],
      sourceChat: widget.sourceChat,
      );
    },)
    );
    
  }
}

