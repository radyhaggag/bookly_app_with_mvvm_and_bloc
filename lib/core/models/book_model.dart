import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../features/home/data/models/book_model/access_info.dart';
import '../../features/home/data/models/book_model/sale_info.dart';
import '../../features/home/data/models/book_model/volume_info.dart';

part 'book_model.g.dart';

@HiveType(typeId: 0)
class BookModel extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String? kind;
  @HiveField(2)
  final String? selfLink;
  @HiveField(3)
  final VolumeInfo volumeInfo;
  @HiveField(4)
  final SaleInfo? saleInfo;
  @HiveField(5)
  final AccessInfo? accessInfo;

  BookModel({
    required this.id,
    this.kind,
    this.selfLink,
    required this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        id: json['id'] as String,
        kind: json['kind'] as String?,
        selfLink: json['selfLink'] as String?,
        volumeInfo:
            VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
        saleInfo: json['saleInfo'] == null
            ? null
            : SaleInfo.fromJson(json['saleInfo'] as Map<String, dynamic>),
        accessInfo: json['accessInfo'] == null
            ? null
            : AccessInfo.fromJson(json['accessInfo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'id': id,
        'selfLink': selfLink,
        'volumeInfo': volumeInfo.toJson(),
        'saleInfo': saleInfo?.toJson(),
        'accessInfo': accessInfo?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      kind,
      id,
      selfLink,
      volumeInfo,
      saleInfo,
      accessInfo,
    ];
  }
}
