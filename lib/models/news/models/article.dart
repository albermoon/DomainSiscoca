import 'package:domain/models/models.dart';

class Article {
  final int? id;
  final String title;
  final String imageUrl;
  final int readingTime;
  final List<NewsCategory> categories;
  final String? dateCreate;
  final String? dateUpdate;
  final String description;
  final String newsUrl;
  final int? status;

  Article({
    this.id,
    required this.title,
    required this.imageUrl,
    required this.readingTime,
    required this.categories,
    this.dateCreate,
    this.dateUpdate,
    required this.description,
    required this.newsUrl,
    this.status,
  });

  factory Article.fromJson(Map<String, dynamic> map) {
    final categoriesList = (map['categories'] as List<dynamic>?)
            ?.map((category) => NewsCategory.fromJson(category as Map<String, dynamic>))
            .toList() ??
        [];

    return Article(
      id: map['id'] as int,
      title: map['title'] as String,
      imageUrl: map['image_url'] as String,
      readingTime: map['read_time'] as int,
      dateCreate: map['date_create'] as String,
      dateUpdate: map['date_update'] as String,
      description: map['description'] as String,
      newsUrl: map['news_url'] as String,
      status: map['status'] as int,
      categories: categoriesList,
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
      'categories': categories.map((c) => c.toJson()).toList(),
    };
  }

  Article copyWith({
    int? id,
    String? title,
    String? imageUrl,
    int? readingTime,
    List<NewsCategory>? categories,
    String? dateCreate,
    String? dateUpdate,
    String? description,
    String? newsUrl,
    int? status,
  }) {
    return Article(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      readingTime: readingTime ?? this.readingTime,
      categories: categories ?? this.categories,
      dateCreate: dateCreate ?? this.dateCreate,
      dateUpdate: dateUpdate ?? this.dateUpdate,
      description: description ?? this.description,
      newsUrl: newsUrl ?? this.newsUrl,
      status: status ?? this.status,
    );
  }
}
