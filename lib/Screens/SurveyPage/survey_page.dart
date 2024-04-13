import 'package:flutter/material.dart';
import 'package:happy2help/Screens/SurveyPage/component/result_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SurveyPage extends StatefulWidget {
  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  final String url = 'https://happy2help.onrender.com';

  late Future<void> _fetchSurveyData;
  List<Map<String, dynamic>> surveyData = [];
  String userEmail = 'atif2@gmail.com';
  int userScore = 0;

  @override
  void initState() {
    super.initState();
    _fetchSurveyData = fetchSurveyData();
  }

  Future<void> fetchSurveyData() async {
    final Map<String, dynamic> requestData = {'name': 'Initial Report'};
    final http.Response response = await http.post(
      Uri.parse('$url/getsurvey'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(requestData),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final List<dynamic> survey = responseData['data'][0]['survey'];

      setState(() {
        surveyData = List<Map<String, dynamic>>.from(survey.map((question) {
          return {
            'question': question['question'],
            'responses': question['responses'], // Add responses here
            'selectedResponse': null,
          };
        }));
      });
    } else {
      throw Exception('Failed to fetch survey data');
    }
  }

  void handleSubmit() async {
    // Format quiz results according to desired format
    List<Map<String, dynamic>> quizResults = surveyData.map((question) {
      int score = 0;
      String selectedResponse = question['selectedResponse'] ?? 'No response';
      List<dynamic> responses = question['responses'];

      // Assign scores based on selected responses
      int index = responses.indexOf(selectedResponse);
      if (index != -1) {
        score = index + 1; // Adding 1 because indices start from 0
      }

      return {
        'question': question['question'],
        'response': selectedResponse, // Updated key to "responses"
        'score': score.toString(), // Convert score to string
      };
    }).toList();

    // Calculate total score
    int totalScore = quizResults.fold<int>(0, (int sum, item) => sum + int.parse(item['score']));

    // Construct request body
    Map<String, dynamic> requestBody = {
      'email': userEmail,
      'score': totalScore,
      'survey': quizResults,
    };

    try {
      // Send POST request to addreport endpoint
      final http.Response response = await http.post(
        Uri.parse('$url/addreport'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(requestBody),
      );

      // Check if request was successful
      if (response.statusCode == 200) {
        // Print response received from API
        print('Response from server: ${response.body}');
        // Parse response JSON
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        // Check if report was added successfully
        if (responseData['success'] == true) {
          // Show snackbar with success message
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Your responses are submitted'),
            ),
          );

          // Navigate to ResultScreen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScreen(totalScore),
            ),
          );
        } else {
          print('Failed to add report: ${responseData['message']}');
        }
      } else {
        print('Failed to send quiz results');
      }
    } catch (e) {
      print('Error sending quiz results: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Survey'),
      ),
      body: FutureBuilder<void>(
        future: _fetchSurveyData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a circular progress indicator while data is loading
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // Show an error message if data fetching fails
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            // Show the survey data once it's loaded
            return ListView.builder(
              itemCount: surveyData.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(surveyData[index]['question']!),
                    subtitle: DropdownButton<String>(
                      value: surveyData[index]['selectedResponse'],
                      onChanged: (String? newValue) {
                        setState(() {
                          surveyData[index]['selectedResponse'] = newValue!;
                        });
                      },
                      items: (surveyData[index]['responses'] as List<dynamic>).map<DropdownMenuItem<String>>(
                            (response) {
                          return DropdownMenuItem<String>(
                            value: response.toString(),
                            child: Text(response.toString()),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: handleSubmit,
        child: const Icon(Icons.check),
      ),
    );
  }
}
