// To parse this JSON data, do
//
//     final showPostModel = showPostModelFromJson(jsonString);

import 'dart:convert';

ShowPostModel showPostModelFromJson(String str) => ShowPostModel.fromJson(json.decode(str));

String showPostModelToJson(ShowPostModel data) => json.encode(data.toJson());

class ShowPostModel {
    bool success;
    List<Post> posts;

    ShowPostModel({
        required this.success,
        required this.posts,
    });

    factory ShowPostModel.fromJson(Map<String, dynamic> json) => ShowPostModel(
        success: json["success"],
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
    };
}

class Post {
    String id;
    String title;
    String content;
    String postedBy;
    int v;

    Post({
        required this.id,
        required this.title,
        required this.content,
        required this.postedBy,
        required this.v,
    });

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["_id"],
        title: json["title"],
        content: json["content"],
        postedBy: json["postedBy"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "content": content,
        "postedBy": postedBy,
        "__v": v,
    };
}
