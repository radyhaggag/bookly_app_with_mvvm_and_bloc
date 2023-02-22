class SearchModel {
  SearchModel({
    required this.searchText,
    this.filterOption,
    this.sortOption,
  });

  final String? filterOption;
  final String? sortOption;
  final String searchText;

  SearchModel copyWith({
    String? filterOption,
    String? sortOption,
    String? searchText,
  }) {
    return SearchModel(
      filterOption: filterOption ?? this.filterOption,
      searchText: searchText ?? this.searchText,
      sortOption: sortOption ?? this.sortOption,
    );
  }
}
