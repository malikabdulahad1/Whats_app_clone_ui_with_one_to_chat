import 'package:flutter/material.dart';


class ButtonCard extends StatelessWidget {

final String? name;
final IconData? icon;
ButtonCard({this.name, this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Color(0XFF25D366),
        radius: 23,
        child:Icon(icon, color: Colors.white,)
      ),
      title: Text('${name}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),),
    );
  }
}