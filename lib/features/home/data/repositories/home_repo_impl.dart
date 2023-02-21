import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../datasources/remote/home_remote_datasource.dart';
import '../models/book_model/book_model.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl(this.homeRemoteDatasource);

  final HomeRemoteDatasource homeRemoteDatasource;

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      final books = await homeRemoteDatasource.fetchFeaturedBooks();
      return right(books);
    } catch (e) {
      return left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      final books = await homeRemoteDatasource.fetchNewestBooks();
      return right(books);
    } catch (e) {
      return left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
    String category,
  ) async {
    try {
      final books = await homeRemoteDatasource.fetchSimilarBooks(
        category,
      );
      return right(books);
    } catch (e) {
      return left(ErrorHandler.handle(e).failure);
    }
  }
}
