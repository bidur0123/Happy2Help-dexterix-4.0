// To parse this JSON data, do
//
//     final createPost = createPostFromJson(jsonString);

import 'dart:convert';

CreatePost createPostFromJson(String str) => CreatePost.fromJson(json.decode(str));

String createPostToJson(CreatePost data) => json.encode(data.toJson());

class CreatePost {
    String title;
    String content;
    String postedBy;

    CreatePost({
        required this.title,
        required this.content,
        required this.postedBy,
    });

    factory CreatePost.fromJson(Map<String, dynamic> json) => CreatePost(
        title: json["title"],
        content: json["content"],
        postedBy: json["postedBy"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "postedBy": postedBy,
    };
}
