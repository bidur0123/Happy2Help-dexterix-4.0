import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy2help/Screens/Community/community.dart';

import 'package:happy2help/services/post_controller.dart';

class AddPostPage extends StatelessWidget {
  final CreatePostController controller = Get.put(CreatePostController());
  // final TextEditingController title = TextEditingController();
  // final TextEditingController content = TextEditingController();
  String? title;
  String? content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (val) {
                title = val;
              },
              decoration: InputDecoration(
                hintText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              onChanged: (val) {
                content = val;
              },
              decoration: InputDecoration(
                hintText: 'Share your thoughts anonymously...',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                controller.createPost(
                  title!,
                  content!,
                  'AnonyMous',
                );
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Community()));
              },
              child: const Text('Post'),
            ),
          ],
        ),
      ),
    );
  }
}
