import 'package:flutter/material.dart';
import 'package:whatsapp_clon/Models/chatModel.dart';
import 'package:whatsapp_clon/whatsapp_Screens/StatusPage.dart';

import 'package:whatsapp_clon/whatsapp_Screens/callsScree.dart';
import 'package:whatsapp_clon/whatsapp_Screens/cameraScreen.dart';
import 'package:whatsapp_clon/whatsapp_Screens/chatScreen.dart';
import 'package:whatsapp_clon/whatsapp_Screens/selectContact.dart';

class MainScreen extends StatefulWidget {
   MainScreen({Key? key, this.chatModels, this.sourceChat}) : super(key: key);

 final List<ChatModel>? chatModels;
 final ChatModel? sourceChat;

  @override
  State<MainScreen> createState() => _MainScreenState();
}


 bool mylight = true;

  
   ThemeData mydarkTheme = ThemeData(
     primarySwatch: Colors.deepOrange,
   brightness:   Brightness.dark,

  );

   ThemeData mylightTheme = ThemeData(
     primarySwatch: Colors.blue,
brightness: Brightness.light,

  );



class _MainScreenState extends State<MainScreen> {
  

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
//         floatingActionButton: FloatingActionButton(
// backgroundColor: Color(0xff084441),
//           onPressed: (){
//          Navigator.push(context, MaterialPageRoute(builder: (context) => SelectContact(),));
//           }, child: Icon(Icons.message),),
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height -780,
          title: Text("Whatsapp", style: TextStyle(fontSize: 25),), backgroundColor: Color(0xff084441),
          
          actions: [
            Row(children: [
                        Switch(
                      
            value: mylight, onChanged: (c){
           setState(() {
             mylight=c;
           });
         
          }),
              IconButton(onPressed: (){}, icon: Icon(Icons.search)),
              PopupMenuButton(itemBuilder: (context) {
              return [
                PopupMenuItem(child: Text('New Group')),
                PopupMenuItem(child: Text('New broadcast')),
                PopupMenuItem(child: Text('Linked devices')),
                PopupMenuItem(child: Text('Starred messages')),
                PopupMenuItem(child: Text('Settings')),
              ];
    
            }
            
          ),

            ],
            
            )
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
            Tab(
              child: Text('Camera'),),
            Tab(child: Text('Chat'),),
            Tab(child: Text('Status'),),
            Tab(child: Text('Calls'),)
    
          ]),
          ),
       body: TabBarView(children: [
       
         CameraScreen(),
         ChatScreen(
           chatModels: widget.chatModels,
           sourceChat: widget.sourceChat,
         ),
         StatusPage(),
         callScreen(),
       ],),
      ),
      
    );
    
  }
}