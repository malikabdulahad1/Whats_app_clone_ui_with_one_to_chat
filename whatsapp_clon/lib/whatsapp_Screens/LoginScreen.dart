import 'package:flutter/material.dart';
import 'package:whatsapp_clon/Models/chatModel.dart';
import 'package:whatsapp_clon/customUi/buttonCard.dart';
import 'package:whatsapp_clon/whatsapp_Screens/mainScreen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
ChatModel? sourceChat;

List<ChatModel> Chat =[
    ChatModel(
      name: 'Abdul Ahad',
      isgroup: false,
      currentMessage: 'Hi! How are you...?',
      time: '18:00',
      icon: 'person.svg',
      id: 1,
    ),

    ChatModel(
      name: 'Hasan Ali',
      isgroup: false,
      currentMessage: 'Hi! How are you...?',
      time: '18:00',
      icon: 'person.svg',
      id: 2,
    ),
    ChatModel(
      name: 'Muhammad Ali',
      isgroup: false,
      currentMessage: 'Hi! How are you...?',
      time: '18:00',
      icon: 'person.svg',
      id: 3,
    ), 
    ChatModel(
      name: ' Ali',
      isgroup: false,
      currentMessage: 'Hi! How are you...?',
      time: '18:00',
      icon: 'person.svg',
      id: 4
    ),
  ];
class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
       return Scaffold(
         body: ListView.builder(
           itemCount: Chat.length,
           itemBuilder: (context, index) {
           return InkWell(
             onTap: (){
               sourceChat= Chat.removeAt(index);
               Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(
                 chatModels: Chat ,
                 sourceChat: sourceChat,
               )));

             },
             child: ButtonCard(name: Chat[index].name, icon: Icons.person,)); 
         },),
       );

  }
}