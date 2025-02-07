import 'package:flutter/material.dart';

class ChatComponent extends StatefulWidget {
  const ChatComponent({super.key});

  @override
  State<ChatComponent> createState() => _ChatComponentState();
}

class _ChatComponentState extends State<ChatComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Home"),
      color: Colors.greenAccent,
    alignment: Alignment.center,);
  }
}
