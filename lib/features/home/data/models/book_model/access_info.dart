import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'pdf.dart';

part 'access_info.g.dart';

@HiveType(typeId: 3)
class AccessInfo extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String? country;
  @HiveField(1)
  final String? viewAbility;
  @HiveField(2)
  final bool? embeddable;
  @HiveField(3)
  final bool? publicDomain;
  @HiveField(4)
  final String? textToSpeechPermission;
  @HiveField(5)
  final Pdf? pdf;
  @HiveField(6)
  final String? webReaderLink;
  @HiveField(7)
  final String? accessViewStatus;
  @HiveField(8)
  final bool? quoteSharingAllowed;

  AccessInfo({
    this.country,
    this.viewAbility,
    this.embeddable,
    this.publicDomain,
    this.textToSpeechPermission,
    this.pdf,
    this.webReaderLink,
    this.accessViewStatus,
    this.quoteSharingAllowed,
  });

  factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
        country: json['country'] as String?,
        viewAbility: json['viewability'] as String?,
        embeddable: json['embeddable'] as bool?,
        publicDomain: json['publicDomain'] as bool?,
        textToSpeechPermission: json['textToSpeechPermission'] as String?,
        pdf: json['pdf'] == null
            ? null
            : Pdf.fromJson(json['pdf'] as Map<String, dynamic>),
        webReaderLink: json['webReaderLink'] as String?,
        accessViewStatus: json['accessViewStatus'] as String?,
        quoteSharingAllowed: json['quoteSharingAllowed'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'country': country,
        'viewability': viewAbility,
        'embeddable': embeddable,
        'publicDomain': publicDomain,
        'textToSpeechPermission': textToSpeechPermission,
        'pdf': pdf?.toJson(),
        'webReaderLink': webReaderLink,
        'accessViewStatus': accessViewStatus,
        'quoteSharingAllowed': quoteSharingAllowed,
      };

  @override
  List<Object?> get props {
    return [
      country,
      viewAbility,
      embeddable,
      publicDomain,
      textToSpeechPermission,
      pdf,
      webReaderLink,
      accessViewStatus,
      quoteSharingAllowed,
    ];
  }
}
