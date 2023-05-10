import 'package:booklib/features/domain/entities/book_entity.dart';

import 'access_info.dart';
import 'sale_info.dart';
import 'volume_info.dart';

class BookModel extends BookEntity {
  final String kind;
  final VolumeInfo volumeInfo;
  final SaleInfo saleInfo;
  final AccessInfo accessInfo;

  BookModel({
    required super.id,
    required this.kind,
    required this.volumeInfo,
    required this.saleInfo,
    required this.accessInfo,
  }) : super(
          title: volumeInfo.title,
          publisher: volumeInfo.publisher,
          thumbnailUrl: volumeInfo.imageLinks?.thumbnail,
          pageCount: volumeInfo.pageCount,
          rating: volumeInfo.averageRating,
          language: volumeInfo.language,
    description: volumeInfo.description,
    authors: volumeInfo.authors
        );

  factory BookModel.fromMap(Map<String, dynamic> json) => BookModel(
        kind: json["kind"],
        id: json["id"],
        volumeInfo: VolumeInfo.fromMap(json["volumeInfo"]),
        saleInfo: SaleInfo.fromMap(json["saleInfo"]),
        accessInfo: AccessInfo.fromMap(json["accessInfo"]),
      );

  Map<String, dynamic> toMap() => {
        "kind": kind,
        "id": id,
        "volumeInfo": volumeInfo.toMap(),
        "saleInfo": saleInfo.toMap(),
        "accessInfo": accessInfo.toMap(),
      };
}
