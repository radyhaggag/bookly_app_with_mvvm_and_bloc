import 'package:bookly_app/core/utils/params.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<ChangeFilterSelectionVisibility>(_changeFilterSelectionVisibility);
    on<ChangeSearchFilterOption>(_changeSearchFilterOption);
    on<ChangeSearchText>(_changeSearchText);
  }

  bool _isFilterSelectionVisible = false;

  void _changeFilterSelectionVisibility(
    ChangeFilterSelectionVisibility event,
    Emitter<SearchState> emit,
  ) {
    _isFilterSelectionVisible = !_isFilterSelectionVisible;
    emit(FilterSelectionVisibilityChanged(_isFilterSelectionVisible));
  }

  SearchParams searchParams = SearchParams(
    searchText: '',
  );

  void _changeSearchFilterOption(
    ChangeSearchFilterOption event,
    Emitter<SearchState> emit,
  ) {
    searchParams = event.searchParams;
    emit(SearchOptionsChanged(searchParams));
  }

  void _changeSearchText(
    ChangeSearchText event,
    Emitter<SearchState> emit,
  ) {
    searchParams = searchParams.copyWith(searchText: event.searchText);
  }
}
