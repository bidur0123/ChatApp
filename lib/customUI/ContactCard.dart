import 'package:chat_app/model/SelectContactModel.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key, required this.contact}) : super(key: key);
  final SelectContactModel contact;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 53,
        width: 50,
        child: Stack(
          children: [
          CircleAvatar (
            radius: 23,
            child: Image.asset(
                "asset/images/userr.png",
              height: 30,
              width: 30,
            ),
            backgroundColor: Colors.blueGrey[200],
          ),
           contact.select
               ? Positioned(
              bottom: 4,
              right: 5,
              child: CircleAvatar (
                radius: 11,
                backgroundColor: Colors.teal,
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            )
            : Container(),
          ],
        ),
      ),
      title: Text(
        contact.name,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        contact.status,
        style: TextStyle(
          fontSize: 13,
        ),
      ),
    );
  }
}
