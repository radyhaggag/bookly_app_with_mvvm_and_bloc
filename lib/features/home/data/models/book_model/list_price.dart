import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'list_price.g.dart';

@HiveType(typeId: 6)
class ListPrice extends HiveObject with EquatableMixin {
  @HiveField(0)
  final double? amount;
  @HiveField(1)
  final String? currencyCode;

  ListPrice({this.amount, this.currencyCode});

  factory ListPrice.fromJson(Map<String, dynamic> json) => ListPrice(
        amount: (json['amount'] as num?)?.toDouble(),
        currencyCode: json['currencyCode'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'currencyCode': currencyCode,
      };

  @override
  List<Object?> get props => [amount, currencyCode];
}
