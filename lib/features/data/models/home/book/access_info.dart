import 'ebub.dart';

class AccessInfo {
    final String country;
    final String viewAbility;
    final bool embeddable;
    final bool publicDomain;
    final String textToSpeechPermission;
    final Epub epub;
    final Epub pdf;
    final String webReaderLink;
    final String accessViewStatus;
    final bool quoteSharingAllowed;

    AccessInfo({
        required this.country,
        required this.viewAbility,
        required this.embeddable,
        required this.publicDomain,
        required this.textToSpeechPermission,
        required this.epub,
        required this.pdf,
        required this.webReaderLink,
        required this.accessViewStatus,
        required this.quoteSharingAllowed,
    });

    factory AccessInfo.fromMap(Map<String, dynamic> json) => AccessInfo(
        country: json["country"],
        viewAbility: json["viewability"],
        embeddable: json["embeddable"],
        publicDomain: json["publicDomain"],
        textToSpeechPermission: json["textToSpeechPermission"],
        epub: Epub.fromMap(json["epub"]),
        pdf: Epub.fromMap(json["pdf"]),
        webReaderLink: json["webReaderLink"],
        accessViewStatus: json["accessViewStatus"],
        quoteSharingAllowed: json["quoteSharingAllowed"],
    );

    Map<String, dynamic> toMap() => {
        "country": country,
        "viewability": viewAbility,
        "embeddable": embeddable,
        "publicDomain": publicDomain,
        "textToSpeechPermission": textToSpeechPermission,
        "epub": epub.toMap(),
        "pdf": pdf.toMap(),
        "webReaderLink": webReaderLink,
        "accessViewStatus": accessViewStatus,
        "quoteSharingAllowed": quoteSharingAllowed,
    };
}