import 'package:flutter/material.dart';
import 'package:whatsapp_clon/Models/chatModel.dart';
import 'package:whatsapp_clon/customUi/buttonCard.dart';

import 'package:whatsapp_clon/customUi/contactCard.dart';
import 'package:whatsapp_clon/whatsapp_Screens/createGroup.dart';

class SelectContact extends StatefulWidget {
   SelectContact({Key? key}) : super(key: key);

 

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
   List<ChatModel> Mycontacts = [
    ChatModel(name: 'Abdul Ahad', status: 'A full stack developer '),
    ChatModel(name: 'Hasan Ali', status: 'A full stack developer '),
    ChatModel(name: 'Naveed Khan', status: 'A full stack developer '),
    ChatModel(name: 'Asad Shafiq', status: 'A full stack developer '),
ChatModel(name: 'Abdullaha Hashmi', status: 'A full stack developer '),
    ChatModel(name: 'Usama Tahir', status: 'A full stack developer '),
    ChatModel(name: 'Muhammad Hasan', status: 'A full stack developer '),
        ChatModel(name: 'Abdul Ahad', status: 'A full stack developer '),
    ChatModel(name: 'Hasan Ali', status: 'A full stack developer '),
    ChatModel(name: 'Naveed Khan', status: 'A full stack developer '),
    ChatModel(name: 'Asad Shafiq', status: 'A full stack developer '),
ChatModel(name: 'Abdullaha Hashmi', status: 'A full stack developer '),
    ChatModel(name: 'Usama Tahir', status: 'A full stack developer '),
    ChatModel(name: 'Muhammad Hasan', status: 'A full stack developer '),
    
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff084441),
        title: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Text('Select Contact', style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold ),),
            Text('255 contacts', style: TextStyle(fontSize: 18,),),
          ],
        ),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.search)),    PopupMenuButton(itemBuilder: (context) {
              return [
                PopupMenuItem(child: Text('Invite a Friend')),
                PopupMenuItem(child: Text('Contacts')),
                PopupMenuItem(child: Text('Refresh')),
                PopupMenuItem(child: Text('help')),
                
              ];
    
            }
            
          ),],
      ),
      body:ListView.builder(
        itemCount: Mycontacts.length,
        itemBuilder: (context, index){
          if(index==0){
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CreateGroup(),));
              },
              child: ButtonCard(icon: Icons.group, name: 'New Group',));
          }
         else if(index==1){
    return ButtonCard(icon: Icons.person_add, name: 'New Contact',);
         }
         return ContactCard(contactsall: Mycontacts[index]);
        },));
    
  }
}