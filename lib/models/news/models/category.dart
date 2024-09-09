import 'package:domain/models/news/interface/i_category.dart';

class NewsCategory extends INewsCategory {
  final int id;
  final String description;

  NewsCategory({
    required super.urlToImage,
    required super.category,
    required this.id,
    required this.description,
  });

  factory NewsCategory.fromJson(Map<String, dynamic> map) {
    return NewsCategory(
      urlToImage: map['image_url'] as String,
      category: map['title'] as String,
      id: map['id'] as int,
      description: map['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': urlToImage,
      'title': category,
      'id': id,
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