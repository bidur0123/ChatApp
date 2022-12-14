import 'package:chat_app/customUI/AvtarCard.dart';
import 'package:chat_app/customUI/ContactCard.dart';
import 'package:chat_app/model/SelectContactModel.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
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
        select: false
    ),
    SelectContactModel(
        name: "Anushka ",
        status: "ML Developer",
        select: false
    ),
  ];

  List<SelectContactModel> groups =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New Group",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Add Participants",
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
        ],
      ),
      body: Stack(
        children:[
          ListView.builder(
            itemCount: contacts.length+1,
            itemBuilder: (context,index){
              if (index==0){
                return Container(
                  height: groups.length > 0 ? 90 :10 ,
                );
              }
              return InkWell(
                onTap: (){
               if(contacts[index-1].select==false){
                 setState(() {
                   contacts[index-1].select=true;
                   groups.add(contacts[index-1]);
                 });
               } else{
                 setState(() {
                   contacts[index-1].select=false;
                   groups.remove(contacts[index-1]);
                 });
               }
                },
                child: ContactCard(
                    contact: contacts[index-1]
                ),
              );
            }
        ),
        groups.length > 0
            ? Column(
            children: [
              Container(
                height: 75,
                color: Colors.white,
                child: ListView.builder(
                  itemCount: contacts.length,
                  scrollDirection: Axis.horizontal,
                    itemBuilder:(context,index){
                    if(contacts[index].select==true){
                      return InkWell(
                        onTap:(){
                          setState(() {
                            contacts[index].select=false;
                            groups.remove(contacts[index]);

                          });
                        },
                        child: AvtarCard(
                          contact: contacts[index],
                        ),
                      );
                    }
                    else{
                      return Container();
                    }
                    }
                ),
              ),
              Divider(
                thickness: 1,
              ),
            ],
          )
          :Container(),
      ],
      ),
    );
  }
}
