import 'package:flutter/material.dart';


class HeadOwnStatus extends StatelessWidget {
  const HeadOwnStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListTile(
      leading:Stack(children: [
        CircleAvatar(
          radius: 27,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage('assets/1.jpg'),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: CircleAvatar(
            radius: 10,
            backgroundColor: Colors.greenAccent[700],
            child: Icon(Icons.add, color: Colors.white, size: 20,),
          ))
      ],),
      title: Text('My Status', style: TextStyle( fontSize: 18,fontWeight: FontWeight.bold),),
      subtitle: Text('Tap to add status update', style: TextStyle(fontSize: 15, color: Colors.grey[900]),),
    );
    
  }
}