import 'dart:convert';
import 'package:happy2help/Screens/bot_akshat/model.dart';
import 'package:http/http.dart' as http;

class ChatBotService {
  static const String apiUrl = 'https://gemini-lhcl.onrender.com/api';

  static Future<ChatBotResponse?> getChatBotResponse(String question) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode(ChatBotRequest(question: question)),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return ChatBotResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load response');
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
