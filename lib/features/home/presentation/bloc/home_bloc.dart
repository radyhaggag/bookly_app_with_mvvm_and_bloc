import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/book_model/book_model.dart';
import '../../data/repositories/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.homeRepo) : super(HomeInitial()) {
    on<LoadFeaturedBooks>(_loadFeaturedBooks);
    on<LoadNewestBooks>(_loadNewestBooks);
  }

  final HomeRepo homeRepo;

  FutureOr<void> _loadFeaturedBooks(
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

  FutureOr<void> _loadNewestBooks(
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
}
