part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class FeaturedBooksLoading extends HomeState {}

class FeaturedBooksLoadingSuccess extends HomeState {
  const FeaturedBooksLoadingSuccess(this.books);

  final List<BookModel> books;
}

class FeaturedBooksLoadingFailed extends HomeState {
  const FeaturedBooksLoadingFailed(this.message);

  final String message;
}

class NewestBooksLoading extends HomeState {}

class NewestBooksLoadingSuccess extends HomeState {
  const NewestBooksLoadingSuccess(this.books);

  final List<BookModel> books;
}

class NewestBooksLoadingFailed extends HomeState {
  const NewestBooksLoadingFailed(this.message);

  final String message;
}

class SimilarBooksLoading extends HomeState {}

class SimilarBooksLoadingSuccess extends HomeState {
  const SimilarBooksLoadingSuccess(this.books);

  final List<BookModel> books;
}

class SimilarBooksLoadingFailed extends HomeState {
  const SimilarBooksLoadingFailed(this.message);

  final String message;
}
