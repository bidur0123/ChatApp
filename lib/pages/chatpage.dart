import 'package:chat_app/customUI/CustomCard.dart';
import 'package:chat_app/screen/SelectContact.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/model/ChatModel.dart';

class Chatpage extends StatefulWidget {
  const Chatpage({Key? key}) : super(key: key);

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  List<ChatModel> chats = [
    ChatModel(
      name: "Bidur Gupta",
      icon: "asset/images/userr.png",
      isGroup: false,
      time: "02:15",
      currentMessage: "hello how are you",
      status: ""
    ),
    ChatModel(
      name: "Aditya Pratap",
      icon: "asset/images/userr.png",
      isGroup: false,
      time: "02:15",
      currentMessage: "hello how are you",
        status: ""
    ),
    ChatModel(
      name: "Ayushi ",
      icon: "asset/images/userr.png",
      isGroup: false,
      time: "02:15",
      currentMessage: "hello how are you",
        status: ""
    ),
    ChatModel(
      name: "Anushka ",
      icon: "asset/images/userr.png",
      isGroup: false,
      time: "02:15",
      currentMessage: "hello how are you",
        status: ""
    ),
    ChatModel(
      name: "Mini Project",
      icon: "asset/images/group.png",
      isGroup: true,
      time: "02:15",
      currentMessage: "hello guys",
        status: ""
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
          onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectContact()));
          },
          child: Icon(
              Icons.chat,
          ),
      ),
      body: ListView.builder(
        itemCount: chats.length,
          itemBuilder:(context, index) => CustomCard(
            chatModel: chats[index],
          ),
      ),
    );
  }
}
