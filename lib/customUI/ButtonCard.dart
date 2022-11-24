import 'package:chat_app/model/SelectContactModel.dart';
import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({Key? key, required this.name,required this.icon}) : super(key: key);
  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 23,
        child: Icon(
            icon,
            size: 26,
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
      ),
      title: Text(
      name,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
