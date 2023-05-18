import 'dart:convert';

class PostModel {
  final int userId;
  final int id;
  final String title;
  final String subTitle;

  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.subTitle,
  });

  PostModel copyWith({
    int? userId,
    int? id,
    String? title,
    String? subTitle,
  }) {
    return PostModel(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        subTitle: subTitle ?? this.subTitle);
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'subTitle': subTitle,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> data) {
    return PostModel(
        userId: data["userId"] ?? 0,
        id: data["id"] ?? 0,
        title: data["title"] ?? '',
        subTitle: data["subTitle"] ?? '');
  }

  String toJsong() => json.encode(toMap());

  // recive The Responce.body without decode
  factory PostModel.fromJson(String source) =>
      // Then decode it here
      PostModel.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostModel &&
        other.userId == userId &&
        other.id == id &&
        other.title == title &&
        other.subTitle == subTitle;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ id.hashCode ^ title.hashCode ^ subTitle.hashCode;
  }
}
