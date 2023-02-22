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
  final SearchModel searchParams;

  const SearchOptionsChanged(this.searchParams);

  @override
  List<Object> get props => [searchParams];
}

class SearchResultLoading extends SearchState {}

class SearchResultLoadingSuccess extends SearchState {
  final List<BookModel> books;

  const SearchResultLoadingSuccess(this.books);
}

class SearchResultLoadingFailed extends SearchState {
  final String message;

  const SearchResultLoadingFailed(this.message);
}
