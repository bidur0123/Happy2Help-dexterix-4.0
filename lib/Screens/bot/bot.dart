import 'package:flutter/material.dart';
import 'package:happy2help/Screens/bot/services.dart';


class ChatBotPage extends StatefulWidget {
  const ChatBotPage({Key? key}) : super(key: key);

  @override
  _ChatBotPageState createState() => _ChatBotPageState();
}

class ChatResponse {
  final String answer;
  final bool isFromUser;

  ChatResponse({required this.answer, this.isFromUser = false});
}

class _ChatBotPageState extends State<ChatBotPage> {
  String _question = '';
  List<ChatResponse> _responses = [];

  void _sendQuestion() async {
    if (_question.isEmpty) return;

    setState(() {
      _responses.add(ChatResponse(answer: _question, isFromUser: true));
    });

    final response = await ChatBotService.getChatBotResponse(_question);
    print('Response from server: $response');
    if (response != null && response.answer != null && response.answer!.isNotEmpty) {
      setState(() {
        _responses.add(ChatResponse(answer: response.answer!));
      });
    } else {
      setState(() {
        _responses.add(ChatResponse(answer: 'Failed to get a response.'));
      });
    }

    _question = ''; // Clear the question after sending
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saathi'), // Change app bar title to "Saathi"
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _responses.length,
              itemBuilder: (context, index) {
                final response = _responses[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: response.isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: response.isFromUser ? Colors.blue : Colors.green,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          response.answer,
                          style: const TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      _question = value;
                    },
                    onSubmitted: (_) => _sendQuestion(),
                    decoration: InputDecoration(
                      hintText: 'Enter your question',
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendQuestion,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
