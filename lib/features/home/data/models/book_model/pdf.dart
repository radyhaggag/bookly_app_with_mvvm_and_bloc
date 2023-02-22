import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'pdf.g.dart';

@HiveType(typeId: 5)
class Pdf extends HiveObject with EquatableMixin {
  @HiveField(0)
  final bool? isAvailable;
  @HiveField(1)
  final String? acsTokenLink;

  Pdf({this.isAvailable, this.acsTokenLink});

  factory Pdf.fromJson(Map<String, dynamic> json) => Pdf(
        isAvailable: json['isAvailable'] as bool?,
        acsTokenLink: json['acsTokenLink'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'isAvailable': isAvailable,
        'acsTokenLink': acsTokenLink,
      };

  @override
  List<Object?> get props => [isAvailable, acsTokenLink];
}
