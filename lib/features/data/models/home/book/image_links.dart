class ImageLinks {
  final String smallThumbnail;
  final String thumbnail;

  ImageLinks({
    required this.smallThumbnail,
    required this.thumbnail,
  });

  factory ImageLinks.fromMap(Map<String, dynamic> json) => ImageLinks(
    smallThumbnail: json["smallThumbnail"],
    thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toMap() => {
    "smallThumbnail": smallThumbnail,
    "thumbnail": thumbnail,
  };
}