import 'package:chat_app/model/SelectContactModel.dart';
import 'package:flutter/material.dart';

class AvtarCard extends StatelessWidget {
  const AvtarCard({Key? key, required this.contact}) : super(key: key);
  final SelectContactModel contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
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
               Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar (
                  radius: 11,
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.clear,
                    color: Colors.white,
                    size: 13,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Text(
              contact.name,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
