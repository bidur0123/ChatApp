import 'package:camera/camera.dart';
import 'package:chat_app/screen/CameraScreen.dart';
import 'package:chat_app/screen/homescreen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras= await availableCameras();

  runApp(const ChatApp());
}

class ChatApp extends StatefulWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  State<ChatApp> createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: Text('ChatApp'),
    //       centerTitle: true,
    //       actions: [
    //         IconButton(
    //           onPressed: (){},
    //           icon:Icon(Icons.search),
    //         ),
    //       ],
    //       bottom: TabBar(
    //           tabs: [
    //             Tab(icon: Icon(Icons.music_note)),
    //             Tab(icon: Icon(Icons.music_video)),
    //             Tab(icon: Icon(Icons.camera_alt)),
    //             Tab(icon: Icon(Icons.grade)),
    //             Tab(icon: Icon(Icons.email)),
    //           ],
    //       ),
    //     ),
    //     drawer: MyDrawer(),
    //   ),
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Open Sans",
          primaryColor: Color(0xff075E54) ,
          accentColor: Color(0xff128C7E),
      ),
      home: Homescreen(),
    ); // MaterialApp
  }
}
