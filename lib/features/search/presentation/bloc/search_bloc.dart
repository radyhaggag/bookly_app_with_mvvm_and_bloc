import 'dart:async';

import '../../../../core/models/book_model.dart';
import '../../data/models/search_model.dart';
import '../../data/repositories/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this.searchRepo) : super(SearchInitial()) {
    on<ChangeFilterSelectionVisibility>(_changeFilterSelectionVisibility);
    on<ChangeSearchFilterOption>(_changeSearchFilterOption);
    on<ChangeSearchText>(_changeSearchText);
    on<LoadSearchResult>(_loadSearchResult);
  }

  final SearchRepo searchRepo;

  bool _isFilterSelectionVisible = false;

  void _changeFilterSelectionVisibility(
    ChangeFilterSelectionVisibility event,
    Emitter<SearchState> emit,
  ) {
    _isFilterSelectionVisible = !_isFilterSelectionVisible;
    emit(FilterSelectionVisibilityChanged(_isFilterSelectionVisible));
  }

  SearchModel searchModel = SearchModel(
    searchText: '',
  );

  void _changeSearchFilterOption(
    ChangeSearchFilterOption event,
    Emitter<SearchState> emit,
  ) {
    searchModel = event.searchModel;
    emit(SearchOptionsChanged(searchModel));
  }

  void _changeSearchText(
    ChangeSearchText event,
    Emitter<SearchState> emit,
  ) {
    searchModel = searchModel.copyWith(searchText: event.searchText);
  }

  FutureOr<void> _loadSearchResult(
    LoadSearchResult event,
    Emitter<SearchState> emit,
  ) async {
    emit(SearchResultLoading());
    final res = await searchRepo.search(searchModel);
    res.fold(
      (failure) => emit(SearchResultLoadingFailed(failure.message)),
      (books) => emit(SearchResultLoadingSuccess(books)),
    );
  }
}
