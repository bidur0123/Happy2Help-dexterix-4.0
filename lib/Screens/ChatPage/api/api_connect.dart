import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiConnection extends GetConnect {
  var url = "https://api.openai.com/v1/chat/completions";
  List<String> messages = [];

  @override
  void onInit() {}

  Future<String?> getResponse(String prompt) async {
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer ${dotenv.env['OPENAI_API_KEY']}",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {"role": "system", "content": "You are a helpful assistant."},
            {"role": "user", "content": prompt},
          ],
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data.containsKey('choices') && data['choices'].isNotEmpty) {
          String message = data['choices'][0]['message']['content'];
          return message;
        } else {
          print('No response message found in API response');
          return null;
        }
      } else {
        print('Failed to fetch response. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Request failed with error: $e');
      return null;
    }
  }

}
