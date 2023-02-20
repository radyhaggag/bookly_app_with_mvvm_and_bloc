import 'app_enums.dart';

class SearchParams {
  SearchParams({
    required this.searchText,
    this.searchFilterOption,
  });

  final SearchFilterOption? searchFilterOption;
  final String searchText;

  SearchParams copyWith({
    SearchFilterOption? searchFilterOption,
    String? searchText,
  }) {
    return SearchParams(
      searchFilterOption: searchFilterOption ?? this.searchFilterOption,
      searchText: searchText ?? this.searchText,
    );
  }
}
