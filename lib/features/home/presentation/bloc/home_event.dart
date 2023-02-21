part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadFeaturedBooks extends HomeEvent {}

class LoadNewestBooks extends HomeEvent {}

class LoadSimilarBooks extends HomeEvent {
  final String category;

  const LoadSimilarBooks(this.category);
}
