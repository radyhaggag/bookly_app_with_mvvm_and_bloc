import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'list_price.dart';

part 'sale_info.g.dart';

@HiveType(typeId: 2)
class SaleInfo extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String? country;
  @HiveField(1)
  final String? saleability;
  @HiveField(2)
  final bool? isEbook;
  @HiveField(3)
  final ListPrice? listPrice;
  @HiveField(4)
  final String? buyLink;

  SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
    this.listPrice,
    this.buyLink,
  });

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
        country: json['country'] as String?,
        saleability: json['saleability'] as String?,
        isEbook: json['isEbook'] as bool?,
        listPrice: json['listPrice'] == null
            ? null
            : ListPrice.fromJson(json['listPrice'] as Map<String, dynamic>),
        buyLink: json['buyLink'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'country': country,
        'saleability': saleability,
        'isEbook': isEbook,
        'listPrice': listPrice?.toJson(),
        'buyLink': buyLink,
      };

  @override
  List<Object?> get props {
    return [
      country,
      saleability,
      isEbook,
      listPrice,
      buyLink,
    ];
  }
}
