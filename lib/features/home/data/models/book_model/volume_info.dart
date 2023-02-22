import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'image_links.dart';

part 'volume_info.g.dart';

@HiveType(typeId: 1)
class VolumeInfo extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final List<String>? authors;
  @HiveField(2)
  final String? publisher;
  @HiveField(3)
  final String? publishedDate;
  @HiveField(4)
  final String? description;
  @HiveField(5)
  final int? pageCount;
  @HiveField(6)
  final String? printType;
  @HiveField(7)
  final List<String>? categories;
  @HiveField(8)
  final num? averageRating;
  @HiveField(9)
  final int? ratingsCount;
  @HiveField(10)
  final ImageLinks? imageLinks;
  @HiveField(11)
  final String? language;
  @HiveField(12)
  final String? previewLink;
  @HiveField(13)
  final String? infoLink;
  @HiveField(14)
  final String? canonicalVolumeLink;

  VolumeInfo({
    required this.title,
    required this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.pageCount,
    this.printType,
    this.categories,
    this.averageRating,
    this.ratingsCount,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json['title'] as String? ?? "",
        authors: (json['authors'] as List<dynamic>?)?.cast<String>(),
        publisher: json['publisher'] as String?,
        publishedDate: json['publishedDate'] as String?,
        description: json['description'] as String?,
        pageCount: json['pageCount'] as int?,
        printType: json['printType'] as String?,
        categories: (json['categories'] as List<dynamic>?)?.cast<String>(),
        averageRating: json['averageRating'] as num?,
        ratingsCount: json['ratingsCount'] as int?,
        imageLinks: json['imageLinks'] == null
            ? null
            : ImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>),
        language: json['language'] as String?,
        previewLink: json['previewLink'] as String?,
        infoLink: json['infoLink'] as String?,
        canonicalVolumeLink: json['canonicalVolumeLink'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'authors': authors,
        'publisher': publisher,
        'publishedDate': publishedDate,
        'description': description,
        'pageCount': pageCount,
        'printType': printType,
        'categories': categories,
        'averageRating': averageRating,
        'ratingsCount': ratingsCount,
        'language': language,
        'previewLink': previewLink,
        'infoLink': infoLink,
        'canonicalVolumeLink': canonicalVolumeLink,
      };

  @override
  List<Object?> get props {
    return [
      title,
      authors,
      publisher,
      publishedDate,
      description,
      pageCount,
      printType,
      categories,
      averageRating,
      ratingsCount,
      imageLinks,
      language,
      previewLink,
      infoLink,
      canonicalVolumeLink,
    ];
  }
}
