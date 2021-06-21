import "package:flutter/material.dart";
import 'package:chat_app/HomePage.dart';

main()=>runApp(ChatApp());

class ChatApp extends StatelessWidget {
  const ChatApp({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"ChatApp",
      debugShowCheckedModeBanner: false,
      home:HomePage()
    );
  }
}