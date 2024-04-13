import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<ChatMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/d1.jpeg'),
            ),
            SizedBox(width: 10),
            Text(
              'Dr Atif',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(10),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _messages[index];
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.photo),
                  onPressed: () {
                    // Implement photo sending functionality
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (text) {
                      _sendMessage(text);
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    final text = _textEditingController.text.trim();
                    if (text.isNotEmpty) {
                      _sendMessage(text);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage(String text) {
    _textEditingController.clear();
    setState(() {
      _messages.insert(
        0,
        ChatMessage(
          text: text,
          isSentByMe: true,
        ),
      );
    });
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isSentByMe;

  const ChatMessage({
    required this.text,
    required this.isSentByMe,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: isSentByMe ? Colors.blue : Colors.grey.shade200,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(15),
            topRight: const Radius.circular(15),
            bottomLeft: isSentByMe ? const Radius.circular(15) : Radius.zero,
            bottomRight: isSentByMe ? Radius.zero : const Radius.circular(15),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSentByMe ? Colors.white : Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
