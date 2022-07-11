import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_clon/Models/chatModel.dart';

class ContactCard extends StatefulWidget {

final ChatModel? contactsall;

ContactCard({this.contactsall});

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 53,
        width: 50,
        child: Stack(
        children: [CircleAvatar(
            backgroundColor: Colors.blueGrey[200],
            radius: 23,
            child: SvgPicture.asset('assets/person.svg', color: Colors.white),
          ),
        widget.contactsall!.select==true?Positioned(
            bottom: 4,
            right: 5 ,
            child: CircleAvatar(
              backgroundColor: Colors.teal,
              radius: 11,
              child: Icon(Icons.check, color: Colors.white, size: 18,)),
          ):Container(),
          ],
        ),
      ),
      title: Text('${widget.contactsall!.name}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),),
      subtitle: Text('${widget.contactsall!.status}'),
    );
  }
}