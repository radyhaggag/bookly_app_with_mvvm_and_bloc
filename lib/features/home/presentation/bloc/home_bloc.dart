import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/book_model.dart';
import '../../data/repositories/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.homeRepo) : super(HomeInitial()) {
    on<LoadFeaturedBooks>(_loadFeaturedBooks);
    on<LoadNewestBooks>(_loadNewestBooks);
    on<LoadSimilarBooks>(_loadSimilarBooks);
  }

  final HomeRepo homeRepo;

  Future<void> _loadFeaturedBooks(
    LoadFeaturedBooks event,
    Emitter<HomeState> emit,
  ) async {
    emit(FeaturedBooksLoading());
    final res = await homeRepo.fetchFeaturedBooks();
    res.fold(
      (failure) => emit(FeaturedBooksLoadingFailed(failure.message)),
      (books) => emit(FeaturedBooksLoadingSuccess(books)),
    );
  }

  Future<void> _loadNewestBooks(
    LoadNewestBooks event,
    Emitter<HomeState> emit,
  ) async {
    emit(NewestBooksLoading());
    final res = await homeRepo.fetchNewestBooks();
    res.fold(
      (failure) => emit(NewestBooksLoadingFailed(failure.message)),
      (books) => emit(NewestBooksLoadingSuccess(books)),
    );
  }

  Future<void> _loadSimilarBooks(
    LoadSimilarBooks event,
    Emitter<HomeState> emit,
  ) async {
    emit(SimilarBooksLoading());
    final res = await homeRepo.fetchSimilarBooks(
      event.category,
    );
    res.fold(
      (failure) => emit(
        SimilarBooksLoadingFailed(failure.message),
      ),
      (books) => emit(
        SimilarBooksLoadingSuccess(books),
      ),
    );
  }
}
