import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:whatsapp_clon/customUi/statuspage/HeadOwnStatus.dart';
import 'package:whatsapp_clon/customUi/statuspage/OtherStatus.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        Container(
          height: 48,
          child: FloatingActionButton(
            elevation: 8,
            backgroundColor: Colors.blueGrey[200],
            onPressed: (){}, child: Icon(Icons.edit, color: Colors.blueGrey[900],),),
        ),
        SizedBox(height: 13,),
        FloatingActionButton(
          backgroundColor: Colors.greenAccent[700],
          elevation: 5,
          onPressed: (){},
          child: Icon(Icons.camera_alt),
          )
      ],),
      body: SingleChildScrollView(
        child: Column(children: [
          // SizedBox(height: 10,),
          HeadOwnStatus(),
          Container(height: 33, width: MediaQuery.of(context).size.width,color: Colors.grey[300],child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
            child: Text('Recent update',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),),
          OtherStatus(name: 'Hasan Ali', time: 'Today at 04:07',),
          OtherStatus(),
          OtherStatus(),
          OtherStatus(),
        ],),
      ),
    );
  }
}