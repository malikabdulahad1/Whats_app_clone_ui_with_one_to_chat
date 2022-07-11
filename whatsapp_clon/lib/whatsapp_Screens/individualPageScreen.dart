
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:whatsapp_clon/Models/chatModel.dart';
import 'package:whatsapp_clon/Models/messageModel.dart';
import 'package:whatsapp_clon/customUi/ReplyCard.dart';
import 'package:whatsapp_clon/customUi/ownMessageCard.dart';

class IndividualPageScreen extends StatefulWidget {
final  ChatModel? IndividualChatModel;
 final ChatModel? sourceChat;

IndividualPageScreen({this.IndividualChatModel, this.sourceChat}); 
  @override
  State<IndividualPageScreen> createState() => _IndividualPageScreenState();
}

class _IndividualPageScreenState extends State<IndividualPageScreen> {
  bool show = false;  
  IO.Socket? socket;
  bool sendButton = false;
  List<MessageModel>messages = [];
  TextEditingController controllerC = TextEditingController();
 ScrollController _scrollController = ScrollController();
  @override

    void initState() {
    // TODO: implement initState
    super.initState();
    connect();
      }

    void connect(){
     socket= IO.io("http://192.168.1.30:5000", <String, dynamic>{
       "transports":["websocket"],
       "autoConnect":false,
     }); 
     socket!.connect();
          socket!.emit("signin", widget.sourceChat!.id);

     socket!.onconnect();
     log('connected');
     socket!.on("message`", (msg) {
           setMessage("destination", msg["message"]);
                  _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(microseconds: 300), curve: Curves.easeInOut);

  
    print(msg);
     });
   }
void sendMessage(String message, int sourceId, int targetId){
  setMessage("source", message);
socket!.emit("message", {"message:": message, "sourceId":sourceId, "targetId" : targetId});
}

void setMessage(String type, String message){
    MessageModel messageModel = MessageModel(type: type, message: message, time: DateTime.now().toString().substring(10, 16));
  setState(() { 
   messages.add(messageModel);  
  });
}
@override
  Widget build(BuildContext context) {
   return Stack(
     
     children: [
     Image.asset("assets/whatsappBackground.png",
     width: MediaQuery.of(context).size.width,
     height: MediaQuery.of(context).size.height,
     fit: BoxFit.cover,
     ),
Scaffold(
  
    backgroundColor: Colors.transparent,
     appBar: PreferredSize(
       preferredSize: Size.fromHeight(60),
       child: AppBar(
         titleSpacing: 2,
         leadingWidth:70,
         backgroundColor: Color(0xff084441),
         leading: InkWell(
           onTap: (){
             Navigator.pop(context);
           },
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
             Icon(Icons.arrow_back, size: 24,),
             CircleAvatar(
               backgroundColor: Colors.blueGrey,
               child:SvgPicture.asset(widget.IndividualChatModel!.isgroup== true? 'assets/group.svg':'assets/person.svg', color: Colors.white,),
             )
           ],),
           
         ),
         title: InkWell(
           onTap: (){},
           child: Container(
             margin: EdgeInsets.all(6),
             child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("${widget.IndividualChatModel!.name}"),
                 Text("last seen today at 12:05", style: TextStyle(fontSize: 14),),
         
               ],
             ),
             
           ),
         ),
         actions: [IconButton(onPressed: (){}, icon: Icon(Icons.videocam_sharp)),
         IconButton(onPressed: (){}, icon: Icon(Icons.call)),
           PopupMenuButton(itemBuilder: (context) {
                return [
                  PopupMenuItem(child: Text('View Contact')),
                  PopupMenuItem(child: Text('Media, links, and docs')),
                  PopupMenuItem(child: Text('Search')),
                  PopupMenuItem(child: Text('Mute Notification')),
                  PopupMenuItem(child: Text('Wallpaper')),
                  PopupMenuItem(child: Text('More')),
                ];
         
              }),
         ],
     
       ),
     ),
     body: Container(
       height: MediaQuery.of(context).size.height,
       width: MediaQuery.of(context).size.width,
       child: Column(
         children: [
         Expanded(
        //   height: MediaQuery.of(context).size.height - 160,
           child: ListView.builder(
            controller: _scrollController,
            itemCount: messages.length+1,
           shrinkWrap: true,

           itemBuilder: (Context, index){
            if (index==messages.length) {
              return Container(height: 30,);
            }
            if (messages[index].type=="source") {
              return OwnMessageCard(message: messages[index].message,
              time: messages[index].time,
              );

            }
            else
            {
              return ReplayCard(message: messages[index].message, 
              time: messages[index].time,
              );
            }
           })
         ),
         Align(
           alignment: Alignment.bottomRight,
           child: Container(
            height: 70,
             child: Column(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               Row(
                 children: [Container(
                   width: MediaQuery.of(context).size.width - 60,
                   child: Card(
                     margin: EdgeInsets.only(left: 2, right: 2, bottom: 8),
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                     child: TextFormField(
                       controller: controllerC,
                       onChanged: (value){
                        if (value.length>0) {
                          setState(() {
                            sendButton =  true;
                          });
                        }
                        else{
                          setState(() {
                            sendButton = false;
                          });
                        }
                       },
                       textAlignVertical: TextAlignVertical.center,
                       keyboardType: TextInputType.multiline,
                       maxLines: 5,
                       minLines: 1,
                       decoration: InputDecoration(
                         hintText: 'Type a message',
                         contentPadding: EdgeInsets.all(5),
                         prefixIcon: IconButton(onPressed: (){
                           setState(() {
                             show =!show;
                           });
                         }, icon: Icon(Icons.emoji_emotions_outlined)),
                         prefixIconColor: Colors.amber,
                         suffixIcon: Row(
                           mainAxisSize: MainAxisSize.min,
                           children: [IconButton(onPressed: (){

                             showModalBottomSheet(
                               backgroundColor: Colors.transparent,
                               context: context, builder: (_){

                                 return bottomSheet(context);
                             });
                           }, icon: Icon(Icons.attach_file_rounded),),
                         IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt))
                         ],)
                       ),
                     ))),
                 Padding(
                   padding: const EdgeInsets.only(bottom: 8, left: 6),
                   child: CircleAvatar(
                              backgroundColor: Color(0xff084441),

                     radius: 24,
  child: IconButton(onPressed: (){
    if (sendButton) {
       _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(microseconds: 300), curve: Curves.easeInOut);
        sendMessage(controllerC.text, widget.sourceChat!.id!, widget.IndividualChatModel!.id!);
        controllerC.clear();
        setState(() {
          sendButton=false;
        });

    }
  }, icon: Icon(sendButton?Icons.send:Icons.mic,
  
   color: Colors.white,)),
                   ),
                 ),
                  
                 ],
               ),
      // if (show) emojiSelect() else Container(),
             ],
             ),
           )
         ),
       ],),
     ),
),
   ],);
  }

//   Widget emojiSelect(){

//     return EmojiPicker(
//       config: Config(
//         columns: 7,
//        // recentsLimit: 28,
//       ),
//       onEmojiSelected: (category, emoji) {
        
    
//     },);
//   }

Widget bottomSheet(BuildContext context){
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 278,
    child: Card(
      margin: EdgeInsets.all(19), 
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
iconcreation(Icon(Icons.insert_drive_file, size: 29,color: Colors.white,), 'Doucments', Colors.indigo ),
iconcreation(Icon(Icons.camera_alt, size: 29,color: Colors.white,), 'Camera', Colors.pink ),
iconcreation(Icon(Icons.insert_photo, size: 29,color: Colors.white,), 'Gallery', Colors.purple )


          ],),    SizedBox(height: 30,),      Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
iconcreation(Icon(Icons.headset,size: 29,color: Colors.white,), 'Audio', Colors.orange ),
iconcreation(Icon(Icons.location_pin, size: 29,color: Colors.white,), 'Location', Colors.pink ),
iconcreation(Icon(Icons.person, size: 29,color: Colors.white,), 'Contacts', Colors.blue )


          ],)
        ],),
      ),),
  );
  }

  Widget iconcreation(Icon c, String t, Color cc){
    return InkWell(
      child: Column(
        children: [
      
       CircleAvatar(
         radius: 30,  
         child: c,
         backgroundColor: cc,
       ),
       SizedBox(height: 5),
       Text(t, style: TextStyle(fontSize: 12),)
    
        ],
      ),
    );
  }
 }