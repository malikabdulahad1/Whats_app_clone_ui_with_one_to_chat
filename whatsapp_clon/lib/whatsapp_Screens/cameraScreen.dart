

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:whatsapp_clon/whatsapp_Screens/VIdeoView.dart';
import 'package:whatsapp_clon/whatsapp_Screens/cameraImagePreview.dart';
class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}
 List<CameraDescription> camera = [];
CameraController? cameraC;

Future<void>? cameraValue;
String? myvideopath;
bool isrecording=false;

class _CameraScreenState extends State<CameraScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cameraC = CameraController(camera[0], ResolutionPreset.high);
    cameraValue = cameraC!.initialize();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    cameraC!.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      body: SingleChildScrollView(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          FutureBuilder(
          future: cameraValue,
            builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.done
            ){
       return CameraPreview(cameraC!);
            }
            else{
             return Center(child: CircularProgressIndicator());
            }
    
          },
          
          ),
         
        Container(color: Colors.black, height: MediaQuery.of(context).size.width - 300,width: MediaQuery.of(context).size.width,child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(child: Icon(Icons.flash_off, color: Colors.white,)),
             GestureDetector(
               
               onLongPress: ()async {
                   myvideopath = join((await getTemporaryDirectory()).path, "${DateTime.now()}.mp4");
                    cameraC!.startVideoRecording();    
                       
                 setState(() {
                   isrecording=true;
                 });

               },

               onLongPressUp: () async {
          await cameraC!.stopVideoRecording();
          setState(() {
            isrecording=false;
            
            Navigator.push(context, MaterialPageRoute(builder: (context) => Videopreview(videopath: myvideopath,),));
          });
               },
               onTap: (){
                 setState(() {
                   if (!isrecording) {
                     
                takeSnap(context);
                   }

                 });
               },
               child: isrecording? Icon(Icons.radio_button_on, color: Colors.red, size: 80,): Icon(Icons.panorama_fish_eye, color: Colors.white, size: 60,)),
              GestureDetector(child: Icon(Icons.camera,color: Colors.white,))
          ],
        ),)
        ],
      ),
    ),);
    
  }
}

  
  void takeSnap(BuildContext c) async{
    XFile mypic;
final path = join((await getTemporaryDirectory()).path, "${DateTime.now()}.png");

     mypic=await cameraC!.takePicture();
     mypic.saveTo(path);
     Navigator.push(c, MaterialPageRoute(builder: (context) => CameraImagePreview(imagepath: path,),));

  }


