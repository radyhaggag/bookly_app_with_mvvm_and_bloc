part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class FilterSelectionVisibilityChanged extends SearchState {
  final bool isVisible;

  const FilterSelectionVisibilityChanged(this.isVisible);

  @override
  List<Object> get props => [isVisible];
}

class SearchOptionsChanged extends SearchState {
  final SearchParams searchParams;

  const SearchOptionsChanged(this.searchParams);

  @override
  List<Object> get props => [searchParams];
}
