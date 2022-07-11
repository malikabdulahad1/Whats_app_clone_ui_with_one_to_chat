import 'package:flutter/cupertino.dart';
class callScreen extends StatefulWidget {
  const callScreen({Key? key}) : super(key: key);

  @override
  State<callScreen> createState() => _callScreenState();
}

class _callScreenState extends State<callScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('calls'),);
    
  }
}