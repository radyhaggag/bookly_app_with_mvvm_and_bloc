import 'app_enums.dart';
import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  Size get _screenSize => MediaQuery.of(this).size;
  double get screenWidth => _screenSize.width;
  double get screenHeight => _screenSize.height;
}

extension SearchFilterStrings on SearchFilterOption {
  String getValue() {
    switch (this) {
      case SearchFilterOption.freeEBooks:
        return 'free-ebooks';
      case SearchFilterOption.paidEBooks:
        return 'paid-ebooks';
      case SearchFilterOption.partial:
        return 'partial';
      case SearchFilterOption.full:
        return 'full';
      case SearchFilterOption.ebooks:
        return 'ebooks';
    }
  }
}

extension SearchSortingStrings on SearchSortingOption {
  String getValue() {
    switch (this) {
      case SearchSortingOption.relevance:
        return 'relevance';
      case SearchSortingOption.newest:
        return 'newest';
    }
  }
}
