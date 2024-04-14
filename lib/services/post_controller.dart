import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:happy2help/constant/constants.dart';
import 'package:happy2help/models/showPostModel.dart';
import 'package:http/http.dart' as http;

class CreatePostController extends GetxController {
  // void createPost(String title, String content, String postedBy) async {
  //   try {
  //     isLoading(true);

  //     // Simulate an API call or integrate with an actual API here
  //     await Future.delayed(Duration(seconds: 2)); // Simulating delay

  //     // Here you can integrate with your API to create a post
  //     // For this example, we'll just print the data

  //     CreatePost post = CreatePost(
  //       title: title,
  //       content: content,
  //       postedBy: postedBy,
  //     );

  //     print('Created Post: ${createPostToJson(post)}');

  //     postCreated(true);
  //     isLoading(false);
  //   } catch (e) {
  //     errorMessage('Failed to create post');
  //     isLoading(false);
  //   }
  Future<void> createPost(String title, String content, String postedBy) async {
    try {
      final response = await http.post(
        Uri.parse('${baseUrl}/createpost'),
        body: json.encode({
          'title': title,
          'content': content,
          'postedBy': "AnonyMous",
        }),
        headers: {'Content-Type': 'application/json'},
      );

      print(response.body);
      print(response.statusCode);
      // Show a snackbar or perform other actions to notify the user of success
      Get.snackbar('Success', 'Posted successfully');
    } catch (error) {
      // Handle errors, you might want to show a snackbar or perform other actions
      print('Error reporting user: $error');
      Get.snackbar('Error', 'Failed to Post . Please try again.');
    }
  }
}

// Import your model file

//
class PostService {
  final Dio dio = Dio();

  Future<List<Post>> fetchPosts() async {
    try {
      final response = await dio.get('$baseUrl/showpost');
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = response.data['posts'];
        return jsonResponse.map((data) => Post.fromJson(data)).toList();
      } else {
        Get.snackbar("Internet Problem", "");
        print('Failed to fetch posts. Status code: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error fetching posts: $e');
      return [];
    }
  }
}
