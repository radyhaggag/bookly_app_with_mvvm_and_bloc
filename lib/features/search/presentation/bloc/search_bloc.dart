import 'package:bookly_app/features/search/search_params.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchEvent>((event, emit) {
      if (event is ChangeFilterSelectionVisibility) {
        _changeFilterSelectionVisibility(emit);
      }
      if (event is ChangeSearchFilterOption) {
        _changeSearchFilterOption(event, emit);
      }
      if (event is ChangeSearchText) {
        _changeSearchText(event, emit);
      }
    });
  }

  bool _isFilterSelectionVisible = false;

  void _changeFilterSelectionVisibility(Emitter<SearchState> emit) {
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
