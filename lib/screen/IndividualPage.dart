import 'package:chat_app/model/ChatModel.dart';
import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';


class IndividualPage extends StatefulWidget {
  const IndividualPage({Key? key , required this.chatModel}) : super(key: key);

  final ChatModel chatModel;

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        leadingWidth: 70,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             const Icon(
                  Icons.arrow_back,
                size: 24,
              ),
              CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.grey.shade400,
                child: Image.asset(
                  widget.chatModel.isGroup ?
                  "asset/images/group.png"
                      :"asset/images/userr.png",
              )
              ),
            ],
        ),
        ),
        title: InkWell(
          onTap: (){},
          child: Container(
            margin:const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    widget.chatModel.name,
                  style:const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                    "12:07 AM",
                  style: TextStyle(
                    fontSize: 14
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon:Icon(Icons.video_call)),
          IconButton(onPressed: (){}, icon:Icon(Icons.call)),
          PopupMenuButton <String>(
            onSelected: (value){},
            itemBuilder:(BuildContext context){
              return const [
                PopupMenuItem(
                  child: Text("View Contact"),
                  value:"View Contact" ,
                ),
                PopupMenuItem(
                  child: Text("Media,Links and Docs"),
                  value:"Media,Links and Docs" ,
                ),
                // PopupMenuItem(
                //   child: Text("Whatsapp Web"),
                //   value:"Whatsapp Web" ,
                // ),
                PopupMenuItem(
                  child: Text("Search"),
                  value:"Search" ,
                ),
                PopupMenuItem(
                  child: Text("Mute Notification"),
                  value:"Mute Notification" ,
                ),
                PopupMenuItem(
                  child: Text("Wallpaper"),
                  value:"Wallpaper" ,
                ),
              ];
            },
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ListView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 55,
                        child: Card(
                          margin: EdgeInsets.only(left: 5, right: 4,bottom: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                            minLines: 1,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Type a message",
                              prefixIcon: IconButton(
                                icon: Icon(Icons.emoji_emotions),
                                onPressed: (){
                                  setState(() {
                                    show=!show;
                                  });
                            //      Navigator.push(context, MaterialPageRoute(builder: (builder)=>EmojiButton()));
                                },
                              ),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: (){
                                         showModalBottomSheet(
                                           backgroundColor: Colors.transparent,
                                             context: context,
                                             builder: (builder)=>bottomsheet());
                                      },
                                      icon: Icon(Icons.attach_file),
                                  ),
                                  IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt)),
                                ],
                              ),
                              contentPadding: EdgeInsets.all(5),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8,right: 2),
                        child: CircleAvatar(
                            radius: 23,
                         // backgroundColor: Color(0xff128C7E),
                          child: IconButton(onPressed: (){},
                              icon: Icon(
                                  Icons.mic,
                                  color: Colors.white,
                              ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  show? emojiSelect() : Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
 Widget bottomsheet(){
    return Container(
       height: 254,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row (
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  iconcreation(
                      Icons.file_copy , Colors.indigo, "Document",
                  ),
                  iconcreation(
                    Icons.camera_alt , Colors.indigo, "Camera",
                  ),
                  iconcreation(
                    Icons.photo , Colors.indigo, "Photos",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row (
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  iconcreation(
                    Icons.headset , Colors.indigo, "Audio",
                  ),
                  iconcreation(
                    Icons.location_on_rounded , Colors.indigo, "Location",
                  ),
                  iconcreation(
                    Icons.perm_contact_calendar_sharp , Colors.indigo, "Contact",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
}
 Widget iconcreation( IconData icon, Color color , String text){
    return InkWell(
      onTap: (){},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundColor: color,
            child: Icon(
              icon,
              size: 29,
              color: Colors.white,
            ),
          ),
          Text(text),
        ],
      ),
    );
 }

  Widget emojiSelect(){
     return
       EmojiPicker(
       onEmojiSelected: (emoji , category){
         print(emoji);
       },
     );

  }

 }

