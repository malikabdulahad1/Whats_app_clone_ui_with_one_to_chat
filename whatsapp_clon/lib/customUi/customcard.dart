import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_clon/Models/chatModel.dart';
import 'package:whatsapp_clon/whatsapp_Screens/individualPageScreen.dart';


class CustomCard extends StatelessWidget {
  
  final ChatModel? chatModel;
   final ChatModel? sourceChat;

  CustomCard({this.chatModel, this.sourceChat});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return IndividualPageScreen(IndividualChatModel: chatModel, sourceChat: sourceChat,);
        },));
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blueGrey,
    
          child: SvgPicture.asset(chatModel!.isgroup== true? 'assets/group.svg':'assets/person.svg', color: Colors.white,),
        ),
        title: Text('${chatModel!.name}'),
        subtitle: Row(children: [
          Icon(Icons.done, size: 20,),
          Text('${chatModel!.currentMessage}')
    
        ],),
        trailing: Text('${chatModel!.time}'),
      ),
    );
  }
}