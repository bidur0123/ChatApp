import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription>? cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
    CameraController? _cameraController;
    Future<void>? cameravalue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController = CameraController(cameras![0], ResolutionPreset.high);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
     body: Stack(
       children: [
         FutureBuilder(
         future: cameravalue,
         builder: (context, snapshot) {
           if(snapshot.connectionState == ConnectionState.done)
             {
               return CameraPreview(_cameraController!);
             }
           else
             {
               return Center(child: CircularProgressIndicator()
               );
             }
         }
         ),
         Positioned(
           bottom: 0.0,
           child: Container(
             color: Colors.black,
             padding: EdgeInsets.only(top: 5, bottom:5 ),
             width: MediaQuery.of(context).size.width,
             child: Column(
                 children:[
                  Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   mainAxisSize: MainAxisSize.max,
                   children: [
                     IconButton(onPressed: (){}, icon: Icon(
                       Icons.flash_off,
                       color: Colors.white,
                       size: 28,
                     )),
                     InkWell(
                         onTap: (){},
                         child: Icon(
                           Icons.panorama_fish_eye,
                           color: Colors.white,
                           size: 70,
                         )),
                     IconButton(
                         onPressed: (){},
                         icon: Icon(
                           Icons.flip_camera_ios,
                           color: Colors.white,
                           size: 28,)),
                   ],
                 ),
                   SizedBox(
                     height: 4.0,
                   ),
                   Text(
                     "Hold for Video and Tap for photo",
                     style: TextStyle(
                       color: Colors.white,
                     ),
                     textAlign: TextAlign.center,
                   ),
                   SizedBox(
                     height: 20.0,
                   ),
                 ],
               ),
           ),
         ),
       ],
     ),
    );
  }
}
