import 'package:flutter/material.dart';
import 'package:whatsapp_clon/Models/chatModel.dart';

import 'package:whatsapp_clon/customUi/contactCard.dart';

class CreateGroup extends StatefulWidget {
   CreateGroup({Key? key}) : super(key: key);

 

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
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

  List<ChatModel> group = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff084441),
        title: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Text('New Group', style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold ),),
            Text('Add Participants', style: TextStyle(fontSize: 18,),),
          ],
        ),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.search)),],
      ),
      body:ListView.builder(
        itemCount: Mycontacts.length,
        itemBuilder: (context, index){
      
         return InkWell(
           onTap : (){
             if ( Mycontacts[index].select==false) {
              setState(() {
                Mycontacts[index].select==true;
                group.add( Mycontacts[index]);
              });
            }
            else{
 setState(() {
                Mycontacts[index].select==false;
                group.remove( Mycontacts[index]);
              });
            }
           },   
           child: ContactCard(contactsall: Mycontacts[index]));
        },));
    
  }
}