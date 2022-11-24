import 'package:chat_app/screen/IndividualPage.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/model/ChatModel.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key , required this.chatModel }) : super(key: key);

   final ChatModel chatModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> IndividualPage(chatModel: chatModel)));
      },
      child: Column(
        children: [
          ListTile(
                leading:CircleAvatar(
                    radius: 25.0,
                  child: Image.asset(
                      chatModel.isGroup ?
                      "asset/images/group.png"
                          :"asset/images/userr.png",
                  ),
                  backgroundColor: Colors.grey.shade400,
      ),
            title:  Text(
                chatModel.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done),
              const  SizedBox(width: 10.0,),
                Text (chatModel.currentMessage),
              ],
            ),
            trailing: Text(chatModel.time),
          ),
         const Padding(
            padding:  EdgeInsets.only(left: 75.0, right: 20.0 ),
            child: Divider (
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
