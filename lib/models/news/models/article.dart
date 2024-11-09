import 'package:domain/models/models.dart';

class Article {
  final int? id;
  final String title;
  final String imageUrl;
  final int readingTime;
  final int categoryId;
  final String? dateCreate;
  final String? dateUpdate;
  final String description;
  final String newsUrl;
  final int? status;
  final NewsCategory category;

  Article({
    this.id,
    required this.title,
    required this.imageUrl,
    required this.readingTime,
    required this.categoryId,
    this.dateCreate,
    this.dateUpdate,
    required this.description,
    required this.newsUrl,
    this.status,
    required this.category,
  });

  factory Article.fromJson(Map<String, dynamic> map) {
    return Article(
      id: map['id'] as int,
      title: map['title'] as String,
      imageUrl: map['image_url'] as String,
      readingTime: map['read_time'] as int,
      categoryId: map['category_id'] as int,
      dateCreate: map['date_create'] as String,
      dateUpdate: map['date_update'] as String,
      description: map['description'] as String,
      newsUrl: map['news_url'] as String,
      status: map['status'] as int,
      category: NewsCategory.fromJson(map['category'] as Map<String, dynamic>),
    );
  }

  get url_news => null;

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'image_url': imageUrl,
      'read_time': readingTime,
      'description': description,
      'news_url': newsUrl,
      'category_id': category.id,
    };
  }

  Article copyWith({
    int? id,
    String? title,
    String? imageUrl,
    int? readingTime,
    int? categoryId,
    String? dateCreate,
    String? dateUpdate,
    String? description,
    String? newsUrl,
    int? status,
    NewsCategory? category,
  }) {
    return Article(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      readingTime: readingTime ?? this.readingTime,
      categoryId: categoryId ?? this.categoryId,
      dateCreate: dateCreate ?? this.dateCreate,
      dateUpdate: dateUpdate ?? this.dateUpdate,
      description: description ?? this.description,
      newsUrl: newsUrl ?? this.newsUrl,
      status: status ?? this.status,
      category: category ?? this.category,
    );
  }
}