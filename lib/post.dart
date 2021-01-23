import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    this.id,
    this.forumName,
    this.forumImageUrl,
    this.locationFlagUrl,
    this.title,
    this.content,
    this.imageUrls,
    this.like,
    this.comment,
    this.view,
  });

  int id;
  String forumName;
  String forumImageUrl;
  String locationFlagUrl;
  String title;
  String content;
  List<String> imageUrls;
  int like;
  int comment;
  int view;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    forumName: json["forumName"],
    forumImageUrl: json["forumImageUrl"],
    locationFlagUrl: json["locationFlagUrl"],
    title: json["title"],
    content: json["content"],
    imageUrls: List<String>.from(json["imageUrls"].map((x) => x)),
    like: json["like"],
    comment: json["comment"],
    view: json["view"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "forumName": forumName,
    "forumImageUrl": forumImageUrl,
    "locationFlagUrl": locationFlagUrl,
    "title": title,
    "content": content,
    "imageUrls": List<dynamic>.from(imageUrls.map((x) => x)),
    "like": like,
    "comment": comment,
    "view": view,
  };
}