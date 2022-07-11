import 'package:flutter/material.dart';


class OtherStatus extends StatelessWidget {
  

  final String? name;
  final String? time;
  final String? imageName;

  OtherStatus({this.name, this.time, this.imageName});


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        backgroundImage: AssetImage(imageName!),
        
      ),
      title: Text(name!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
      subtitle: Text(time!, style: TextStyle(fontSize: 14, color: Colors.grey[900]),),
    );
  }
}