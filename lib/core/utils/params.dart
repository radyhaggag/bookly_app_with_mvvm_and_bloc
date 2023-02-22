import 'app_enums.dart';

class SearchParams {
  SearchParams({
    required this.searchText,
    this.searchFilterOption,
    this.searchSortingOption,
  });

  final SearchFilterOption? searchFilterOption;
  final SearchSortingOption? searchSortingOption;
  final String searchText;

  SearchParams copyWith({
    SearchFilterOption? searchFilterOption,
    SearchSortingOption? searchSortingOption,
    String? searchText,
  }) {
    return SearchParams(
      searchFilterOption: searchFilterOption ?? this.searchFilterOption,
      searchText: searchText ?? this.searchText,
      searchSortingOption: searchSortingOption ?? this.searchSortingOption,
    );
  }
}
