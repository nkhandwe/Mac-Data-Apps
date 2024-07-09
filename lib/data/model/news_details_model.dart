// To parse this JSON data, do
//
//     final newsDetailsModel = newsDetailsModelFromJson(jsonString);

import 'dart:convert';

NewsDetailsModel newsDetailsModelFromJson(String str) =>
    NewsDetailsModel.fromJson(json.decode(str));

String newsDetailsModelToJson(NewsDetailsModel data) =>
    json.encode(data.toJson());

class NewsDetailsModel {
  final bool? success;
  final String? message;
  final Data? data;

  NewsDetailsModel({
    this.success,
    this.message,
    this.data,
  });

  factory NewsDetailsModel.fromJson(Map<String, dynamic> json) =>
      NewsDetailsModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  final News? news;
  final List<Comment>? comments;

  Data({
    this.news,
    this.comments,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        news: json["news"] == null ? null : News.fromJson(json["news"]),
        comments: json["comments"] == null
            ? []
            : List<Comment>.from(
                json["comments"]!.map((x) => Comment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "news": news?.toJson(),
        "comments": comments == null
            ? []
            : List<dynamic>.from(comments!.map((x) => x.toJson())),
      };
}

class Comment {
  final int? id;
  final String? content;
  final String? createdAt;
  final String? user;
  final String? avatar;
  final int? positiveVotes;
  final int? negativeVotes;
  final List<dynamic>? pVotesUserIds;
  final List<dynamic>? nVotesUserIds;
  final List<Comment>? childComments;

  Comment({
    this.id,
    this.content,
    this.createdAt,
    this.user,
    this.avatar,
    this.positiveVotes,
    this.negativeVotes,
    this.pVotesUserIds,
    this.nVotesUserIds,
    this.childComments,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        content: json["content"],
        createdAt: json["created_at"],
        user: json["user"],
        avatar: json["avatar"],
        positiveVotes: json["positive_votes"],
        negativeVotes: json["negative_votes"],
        pVotesUserIds: json["p_votes_user_ids"] == null
            ? []
            : List<dynamic>.from(json["p_votes_user_ids"]!.map((x) => x)),
        nVotesUserIds: json["n_votes_user_ids"] == null
            ? []
            : List<dynamic>.from(json["n_votes_user_ids"]!.map((x) => x)),
        childComments: json["child_comments"] == null
            ? []
            : List<Comment>.from(
                json["child_comments"]!.map((x) => Comment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
        "created_at": createdAt,
        "user": user,
        "avatar": avatar,
        "positive_votes": positiveVotes,
        "negative_votes": negativeVotes,
        "p_votes_user_ids": pVotesUserIds == null
            ? []
            : List<dynamic>.from(pVotesUserIds!.map((x) => x)),
        "n_votes_user_ids": nVotesUserIds == null
            ? []
            : List<dynamic>.from(nVotesUserIds!.map((x) => x)),
        "child_comments": childComments == null
            ? []
            : List<dynamic>.from(childComments!.map((x) => x.toJson())),
      };
}

class News {
  final int? id;
  final String? title;
  final int? langId;
  final String? slug;
  final String? subTitle;
  final dynamic tags;
  final String? content;
  final String? metaTitle;
  final String? metaDescription;
  final String? metaKeywords;
  final String? updatedAt;
  final String? author;
  final String? url;
  final String? pathSmall;
  final String? pathMedium;
  final String? pathLarge;
  final String? loading;
  final String? status;
  final String? type;
  final dynamic gallery;
  final dynamic files;
  final NewsBookmark? newsBookmark;

  News({
    this.id,
    this.title,
    this.langId,
    this.slug,
    this.subTitle,
    this.tags,
    this.content,
    this.metaTitle,
    this.metaDescription,
    this.metaKeywords,
    this.updatedAt,
    this.author,
    this.url,
    this.pathSmall,
    this.pathMedium,
    this.pathLarge,
    this.loading,
    this.status,
    this.type,
    this.gallery,
    this.files,
    this.newsBookmark,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
        id: json["id"],
        title: json["title"],
        langId: json["lang_id"],
        slug: json["slug"],
        subTitle: json["sub_title"],
        tags: json["tags"],
        content: json["content"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        metaKeywords: json["meta_keywords"],
        updatedAt: json["updated_at"],
        author: json["author"],
        url: json["url"],
        pathSmall: json["path_small"],
        pathMedium: json["path_medium"],
        pathLarge: json["path_large"],
        loading: json["loading"],
        status: json["status"],
        type: json["type"],
        gallery: json["gallery"],
        files: json["files"],
        newsBookmark: json["newsBookmark"] == null
            ? null
            : NewsBookmark.fromJson(json["newsBookmark"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "lang_id": langId,
        "slug": slug,
        "sub_title": subTitle,
        "tags": tags,
        "content": content,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_keywords": metaKeywords,
        "updated_at": updatedAt,
        "author": author,
        "url": url,
        "path_small": pathSmall,
        "path_medium": pathMedium,
        "path_large": pathLarge,
        "loading": loading,
        "status": status,
        "type": type,
        "gallery": gallery,
        "files": files,
        "newsBookmark": newsBookmark?.toJson(),
      };
}

class NewsBookmark {
  final int? newsId;

  NewsBookmark({
    this.newsId,
  });

  factory NewsBookmark.fromJson(Map<String, dynamic> json) => NewsBookmark(
        newsId: json["news_id"],
      );

  Map<String, dynamic> toJson() => {
        "news_id": newsId,
      };
}
