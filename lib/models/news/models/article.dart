import '../interface/i_article.dart';

class Article extends IArticle {
  Article({
    required super.id,
    required super.title,
    required super.subtitle,
    required super.author,
    required super.category,
    required super.imageUrl,
    required super.readingTime,
    required super.createdAt,
    required super.url,
  });

  Article copyWith({
    int? id,
    String? title,
    String? subtitle,
    String? author,
    String? category,
    String? imageUrl,
    int? readingTime,
    DateTime? createdAt,
    String? url,
  }) {
    return Article(
      id: id ?? super.id,
      title: title ?? super.title,
      subtitle: subtitle ?? super.subtitle,
      author: author ?? super.author,
      category: category ?? super.category,
      imageUrl: imageUrl ?? super.imageUrl,
      readingTime: readingTime ?? super.readingTime,
      createdAt: createdAt ?? super.createdAt,
      url: url ?? super.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'author': author,
      'category': category,
      'imageUrl': imageUrl,
      'readingTime': readingTime,
      'createdAt': createdAt.toIso8601String(),
      'url': url,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      id: map['id'] is int ? map['id'] : int.parse(map['id'].toString()),
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      author: map['author'] as String,
      category: map['category'] as String,
      imageUrl: map['imageUrl'] as String,
      readingTime: map['readingTime'] as int, 
      createdAt: DateTime.parse(map['createdAt'] as String),
      url: map['url'] as String,
    );
  }
}
