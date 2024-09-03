import 'package:equatable/equatable.dart';

abstract class INewsCategory extends Equatable {

  final String urlToImage;
  final String category;

  const INewsCategory({
    required this.urlToImage,
    required this.category,
  });


  @override
  bool get stringify => true;

  @override
  List<Object> get props => [urlToImage, category];
}
