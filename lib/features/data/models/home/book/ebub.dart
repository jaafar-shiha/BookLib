class Epub {
  final bool? isAvailable;
  final String? acsTokenLink;

  Epub({
     this.isAvailable,
     this.acsTokenLink,
  });

  factory Epub.fromMap(Map<String, dynamic> json) => Epub(
    isAvailable: json["isAvailable"]??false,
    acsTokenLink: json["acsTokenLink"],
  );

  Map<String, dynamic> toMap() => {
    "isAvailable": isAvailable,
    "acsTokenLink": acsTokenLink,
  };
}