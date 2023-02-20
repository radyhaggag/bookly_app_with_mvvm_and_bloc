import 'package:bookly_app/core/utils/app_enums.dart';
import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  Size get _screenSize => MediaQuery.of(this).size;
  double get screenWidth => _screenSize.width;
  double get screenHeight => _screenSize.height;
}

extension SearchFilterStrings on SearchFilterOption {
  String getValue() {
    switch (this) {
      case SearchFilterOption.freeBooks:
        return 'Free e-books';
      case SearchFilterOption.partial:
        return 'Partial';
      case SearchFilterOption.full:
        return 'Full';
    }
  }
}
