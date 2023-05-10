
class IndustryIdentifier {
  final String type;
  final String identifier;

  IndustryIdentifier({
    required this.type,
    required this.identifier,
  });

  factory IndustryIdentifier.fromMap(Map<String, dynamic> json) => IndustryIdentifier(
    type: json["type"],
    identifier: json["identifier"],
  );

  Map<String, dynamic> toMap() => {
    "type": type,
    "identifier": identifier,
  };
}
