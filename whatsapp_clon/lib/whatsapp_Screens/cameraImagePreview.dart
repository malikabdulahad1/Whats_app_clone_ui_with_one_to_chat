import 'dart:io';

import 'package:flutter/material.dart';


class CameraImagePreview extends StatelessWidget {
 
 String? imagepath;

 CameraImagePreview({this.imagepath});

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
        child: Column(children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.79,
            child: Image.file(File(imagepath!), fit: BoxFit.cover,)),
      
           TextFormField(
             
             decoration: InputDecoration(
                         fillColor: Colors.amber,

              border: OutlineInputBorder(
                
                borderRadius: BorderRadius.circular(30), ),
               hintText: 'Add your Caption...',
               hintStyle: TextStyle(color: Colors.white)
               ),
           )
        ],
          
        ),
      ),
  );}
}