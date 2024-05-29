class ChatBotRequest {
  final String question;

  ChatBotRequest({required this.question});

  Map<String, dynamic> toJson() {
    return {
      'question': question,
    };
  }
}

class ChatBotResponse {
  final String answer;

  ChatBotResponse({required this.answer});

  factory ChatBotResponse.fromJson(Map<String, dynamic> json) {
    return ChatBotResponse(answer: json['answer']);
  }
}
