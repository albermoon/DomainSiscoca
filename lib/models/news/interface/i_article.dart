import 'package:equatable/equatable.dart';

abstract class  IArticle extends Equatable {
  final int id;
  final String title;
  final String subtitle;
  final String author;
  final String category;
  final String imageUrl;
  final int readingTime;
  final DateTime createdAt;
  final String url;

  const IArticle({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.category,
    required this.imageUrl,
    required this.readingTime,
    required this.createdAt,
    required this.url
  });

  @override
  List<Object?> get props => [
    id,
    title,
    subtitle,
    author,
    category,
    imageUrl,
    createdAt,
    url
  ];

}