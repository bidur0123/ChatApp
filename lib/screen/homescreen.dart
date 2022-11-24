import 'package:chat_app/MyDrawer.dart';
import 'package:chat_app/pages/CameraPage.dart';
import 'package:chat_app/pages/chatpage.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 4, vsync:this,initialIndex: 0);
  }
  Widget build(BuildContext context) {
    return Scaffold(
    //  backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
            'ChatApp',
          style: TextStyle(
         //   fontFamily: 'Open Sans'

          ),
        ),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: (){}),
         PopupMenuButton <String>(
           onSelected: (value){},
             itemBuilder:(BuildContext context){
               return const [
                 PopupMenuItem(
                     child: Text("New Group"),
                     value:"New Group" ,
                 ),
                 PopupMenuItem(
                   child: Text("BroadCast Message"),
                   value:"BroadCast Message" ,
                 ),
                 // PopupMenuItem(
                 //   child: Text("Whatsapp Web"),
                 //   value:"Whatsapp Web" ,
                 // ),
                 PopupMenuItem(
                   child: Text("Settings"),
                   value:"Settings" ,
                 ),
               ];
             },
         ),
        ],
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          tabs: const [
             Tab(
               icon: Icon(Icons.camera_alt),
             ),
            Tab(
              text: "CHAT",
            ),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: "CALLS",
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
      body: TabBarView(
        controller: _controller,
        children: [
          CameraPage(),
          Chatpage(),
          Text("Status"),
          Text("Calls"),

        ],
      ),
    );
  }
}
