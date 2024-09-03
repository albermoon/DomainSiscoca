import 'package:domain/models/news/interface/i_category.dart';

class NewsCategory extends INewsCategory {
  NewsCategory({
    required super.urlToImage,
    required super.category,
  });

  NewsCategory copyWith({
    String? urlToImage,
    String? category,
  }) {
    return NewsCategory(
      urlToImage: urlToImage ?? super.urlToImage,
      category: category ?? super.category,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'urlToImage': urlToImage,
      'category': category,
    };
  }

  factory NewsCategory.fromMap(Map<String, dynamic> map) {
    return NewsCategory(
      urlToImage: map['urlToImage'] as String,
      category: map['category'] as String,
    );
  }
}