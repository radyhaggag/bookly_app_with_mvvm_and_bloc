part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class ChangeFilterSelectionVisibility extends SearchEvent {}

class ChangeSearchFilterOption extends SearchEvent {
  final SearchModel searchModel;

  const ChangeSearchFilterOption(this.searchModel);

  @override
  List<Object> get props => [searchModel];
}

class ChangeSearchText extends SearchEvent {
  final String searchText;

  const ChangeSearchText(this.searchText);

  @override
  List<Object> get props => [searchText];
}

class LoadSearchResult extends SearchEvent {}
