import 'package:equatable/equatable.dart';

class BookEntity extends Equatable {
  final String id;
  final String title;
  final String? thumbnailUrl;
  final String? publisher;
  final num? rating;
  final int? pageCount;
  final String? language;
  final String? description;
  final List<String>? authors;

  const BookEntity({
    required this.id,
    required this.title,
    this.thumbnailUrl,
    this.publisher,
    this.rating,
    this.pageCount,
    this.language,
    this.description,
    this.authors,
  });

  @override
  List<Object?> get props => [id];
}
