import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy2help/Screens/ChatPage/api/api_connect.dart';
import 'package:happy2help/constant/constants.dart';

import 'components/initial_prompt_card.dart';
import '../menu_page/menu_page.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  late TextEditingController promptController;
  List<String> messages = [];
  String currentText = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    promptController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Saathi"),
          centerTitle: true,
          elevation: 0,
          // leading: IconButton(
          //   icon: const Icon(Icons.menu),
          //   onPressed: () {
          //     Get.to(() => const MenuPage());
          //   },
          // ),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_horiz_rounded),
              onPressed: () {
                // Open search
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Column(
                  children: [
                    Text(
                      'You Can,',
                      style:
                          TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'try these searches',
                      style: TextStyle(
                        fontSize: 8.0,
                      ),
                    ),
                  ],
                ),
                const Expanded(
                  flex: 3,
                  child: Column(children: [
                    InitialPromptCard(
                        icon: Icon(Icons.airplanemode_active),
                        text: 'Are you basically satisfied with your life?'),
                    InitialPromptCard(
                        icon: Icon(Icons.umbrella),
                        text:
                            ' Do you often get bored?'),
                    InitialPromptCard(
                        icon: Icon(Icons.food_bank),
                        text:
                            'Do you feel pretty worthless the way you are now?'),
                  ]),
                ),
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: kThemeColor, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Happy to see you! I\'ve learned a lot from you, what should we explore next?',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      // Expanded(
                      //   flex: 1,
                      //   child: IconButton(
                      //     // Inside the onPressed callback of the send button
                      //       onPressed: ()  {
                      //
                      //       },
                      //       icon: const Icon(
                      //         Icons.chat_bubble_outline_rounded,
                      //         color: Colors.black,
                      //         size: 30,
                      //       )),
                      // ),
                      Expanded(
                        flex: 6,
                        child: TextFormField(
                          controller: promptController,
                          onChanged: (text) {
                            currentText = text; // Update current text
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Type a message...',
                            hintStyle: const TextStyle(color: Colors.grey),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            suffixIcon: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.send),
                                  onPressed: () async {
                                    String? response = await ApiConnection().getResponse(promptController.text);
                                    if (response != null) {
                                      setState(() {
                                        messages.add(response);
                                        promptController.text = currentText; // Restore the entered text
                                      });
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}