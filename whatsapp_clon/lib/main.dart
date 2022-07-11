import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clon/whatsapp_Screens/LoginScreen.dart';
import 'package:whatsapp_clon/whatsapp_Screens/cameraScreen.dart';
import 'package:whatsapp_clon/whatsapp_Screens/mainScreen.dart';

 Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  camera = await availableCameras();
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your applicatio2n.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: mylight==true?mylightTheme:mydarkTheme,
debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

