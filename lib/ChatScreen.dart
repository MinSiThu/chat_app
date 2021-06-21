import 'package:flutter/material.dart';
import 'ChatMessage.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen();

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<ChatMessage> _messages = [];

  _handleSubmit(String text) {
    _textEditingController.clear();
    ChatMessage message = ChatMessage(
      text: text,
    );
    setState(() {
      _messages.add(message);
    });
  }

  _textComposerWidget() {
    return IconTheme(
        data: IconThemeData(color: Colors.blue),
        child: Container(
          margin: EdgeInsets.all(10),
          child: Row(
            children: [
              Flexible(
                  child: TextField(
                decoration: InputDecoration(hintText: "Enter Message"),
                controller: _textEditingController,
                onSubmitted: _handleSubmit,
              )),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () => _handleSubmit(_textEditingController.text),
                  ))
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
            child: new ListView.builder(
          padding: EdgeInsets.all(10),
          itemBuilder: (_, index) => _messages[index],
          itemCount: _messages.length,
        )),
        SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(color: Theme.of(context).cardColor),
          child: _textComposerWidget(),
        )
      ],
    );
  }
}
