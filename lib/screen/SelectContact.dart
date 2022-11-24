import 'package:chat_app/customUI/ButtonCard.dart';
import 'package:chat_app/customUI/ContactCard.dart';
import 'package:chat_app/model/ChatModel.dart';
import 'package:chat_app/model/SelectContactModel.dart';
import 'package:chat_app/screen/CreateGroup.dart';
import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    List<SelectContactModel> contacts =[
      SelectContactModel(
          name: "Bidur Gupta",
          status: "Flutter Developer",
          select: false
      ),
      SelectContactModel(
          name: "Aditya Pratap",
          status: "Freelancer",
          select: false
      ),
      SelectContactModel(
          name: "Ayushi Garg",
          status: "Topper Ladki",
          select: false,
      ),
      SelectContactModel(
          name: "Anushka ",
          status: "ML Developer",
          select: false
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "Select Contact",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "4 Contacts",
              style: TextStyle(
                fontSize: 13,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: (){},
              icon: Icon(Icons.search,
                size: 26,
              ),
          ),
          PopupMenuButton <String>(
            onSelected: (value){},
            itemBuilder:(BuildContext context){
              return const [
                PopupMenuItem(
                  child: Text("Invite a friends"),
                  value:"Invite a friends" ,
                ),
                PopupMenuItem(
                  child: Text("Contacts"),
                  value:"Contacts" ,
                ),
                PopupMenuItem(
                  child: Text("Refresh"),
                  value:"Refresh" ,
                ),
                PopupMenuItem(
                  child: Text("Help"),
                  value:"Help" ,
                ),
              ];
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length+2,
          itemBuilder: (context,index)
          {
            if(index==0){
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>CreateGroup()));
                },
                child: ButtonCard(
                  icon: Icons.group,
                  name: "New Group",
                ),
              );
            }
            else if (index==1){
              return ButtonCard (
                icon: Icons.person_add,
                name: "New Contact",
              );
            }
            return ContactCard(
                contact: contacts[index-2]
            );
          }
      ),
    );
  }
}
