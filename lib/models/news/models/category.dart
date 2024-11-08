import 'package:domain/models/news/interface/i_category.dart';

class NewsCategory extends INewsCategory {
  final int? id;
  final String description;

  NewsCategory({
    this.id,
    required super.urlToImage,
    required super.category,
    required this.description,
  });

  factory NewsCategory.fromJson(Map<String, dynamic> map) {
    return NewsCategory(
      id: map['id'] as int,
      urlToImage: map['image_url'] as String,
      category: map['title'] as String,
      description: map['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id, // Only include 'id' if it is not null
      'image_url': urlToImage,
      'title': category,
      'description': description,
    };
  }
  NewsCategory copyWith({
    String? urlToImage,
    String? category,
    int? id,
    String? description,
  }) {
    return NewsCategory(
      urlToImage: urlToImage ?? this.urlToImage,
      category: category ?? this.category,
      id: id ?? this.id,
      description: description ?? this.description,
    );
  }
}