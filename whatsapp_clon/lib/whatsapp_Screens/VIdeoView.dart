import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class Videopreview extends StatefulWidget {
 

 Videopreview({this.videopath});
 String? videopath;

  @override
  State<Videopreview> createState() => _VideopreviewState();
}

class _VideopreviewState extends State<Videopreview> {
    VideoPlayerController? controllerV;
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerV = VideoPlayerController.file(File(widget.videopath!))..initialize().then((value){
      setState(() {
        
      });
    });
  }
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black,
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
        IconButton(onPressed: (){}, icon: Icon(Icons.crop)),
        IconButton(onPressed: (){}, icon: Icon(Icons.emoji_emotions_outlined)),
        IconButton(onPressed: (){}, icon: Icon(Icons.edit))
      ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [Column(children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.79,
            child: AspectRatio(aspectRatio: controllerV!.value.aspectRatio, child: VideoPlayer(controllerV!),

            ),),
      
           TextFormField(
             
             decoration: InputDecoration(
                         fillColor: Colors.amber,

              border: OutlineInputBorder(
                
                borderRadius: BorderRadius.circular(30), ),
               hintText: 'Add your Caption...',
               hintStyle: TextStyle(color: Colors.white)
               ),
           ),

           
        ],
          
        ),
        Align(
             alignment: Alignment.center,
             child: InkWell(
               onTap: (){
                 setState(() {
                   controllerV!.value.isPlaying?controllerV!.pause():controllerV!.play();
                 });
               },
               child: CircleAvatar(
               backgroundColor: Colors.red,
                 radius: 30,
               child: Icon(controllerV!.value.isPlaying?Icons.pause:Icons.play_arrow, color: Colors.white, size: 50,)),))
        ],),
      ),
  );}
}