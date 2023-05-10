import 'image_links.dart';
import 'industry_identifier.dart';

class VolumeInfo {
  final String title;
  final List<String> authors;
  final String? publisher;
  final DateTime? publishedDate;
  final String? description;
  final List<IndustryIdentifier>? industryIdentifiers;
  final int? pageCount;
  final String? printType;
  final List<String>? categories;
  final num? averageRating;
  final int? ratingsCount;
  final String? maturityRating;
  final bool? allowAnonLogging;
  final String? contentVersion;
  final ImageLinks? imageLinks;
  final String? language;
  final String? previewLink;
  final String? infoLink;
  final String? canonicalVolumeLink;

  VolumeInfo({
    required this.title,
    required this.authors,
     this.publisher,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.pageCount,
    this.printType,
    this.categories,
    this.averageRating,
    this.ratingsCount,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  factory VolumeInfo.fromMap(Map<String, dynamic> json) => VolumeInfo(
        title: json["title"],
        authors: List<String>.from(json["authors"].map((x) => x)),
        publisher: json["publisher"],
        publishedDate: json["publishedDate"] == null ? null : (json["publishedDate"].toString().length == 10) ? DateTime.parse(json["publishedDate"]) : DateTime(int.parse(json["publishedDate"])),
        description: json["description"],
        industryIdentifiers:
            List<IndustryIdentifier>.from(json["industryIdentifiers"].map((x) => IndustryIdentifier.fromMap(x))),
        pageCount: json["pageCount"],
        printType: json["printType"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        averageRating: json["averageRating"],
        ratingsCount: json["ratingsCount"],
        maturityRating: json["maturityRating"],
        allowAnonLogging: json["allowAnonLogging"],
        contentVersion: json["contentVersion"],
        imageLinks: json["imageLinks"] == null ? null : ImageLinks.fromMap(json["imageLinks"]),
        language: json["language"],
        previewLink: json["previewLink"],
        infoLink: json["infoLink"],
        canonicalVolumeLink: json["canonicalVolumeLink"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "authors": List<dynamic>.from(authors.map((x) => x)),
        "publisher": publisher,
        "publishedDate":
            "${publishedDate?.year.toString().padLeft(4, '0')}-${publishedDate?.month.toString().padLeft(2, '0')}-${publishedDate?.day.toString().padLeft(2, '0')}",
        "description": description,
        "industryIdentifiers": industryIdentifiers == null ? [] : List<dynamic>.from(industryIdentifiers!.map((x) => x.toMap())),
        "pageCount": pageCount,
        "printType": printType,
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x)),
        "averageRating": averageRating,
        "ratingsCount": ratingsCount,
        "maturityRating": maturityRating,
        "allowAnonLogging": allowAnonLogging,
        "contentVersion": contentVersion,
        "imageLinks": imageLinks?.toMap(),
        "language": language,
        "previewLink": previewLink,
        "infoLink": infoLink,
        "canonicalVolumeLink": canonicalVolumeLink,
      };
}
