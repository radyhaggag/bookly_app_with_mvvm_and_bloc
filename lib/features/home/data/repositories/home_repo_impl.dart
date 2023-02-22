import 'package:dartz/dartz.dart';

import '../../../../core/config/connectivity_checker.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/models/book_model.dart';
import '../datasources/local/home_local_datasource.dart';
import '../datasources/remote/home_remote_datasource.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl({
    required this.homeRemoteDatasource,
    required this.homeLocalDatasource,
    required this.baseCheckInternetConnectivity,
  });

  final HomeRemoteDatasource homeRemoteDatasource;
  final HomeLocalDatasource homeLocalDatasource;
  final BaseCheckInternetConnectivity baseCheckInternetConnectivity;

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      List<BookModel> books = [];
      if (await baseCheckInternetConnectivity.isConnected()) {
        books = await homeRemoteDatasource.fetchFeaturedBooks();
      } else {
        books = homeLocalDatasource.fetchFeaturedBooks();
      }
      return right(books);
    } catch (e) {
      return left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      List<BookModel> books = [];
      if (await baseCheckInternetConnectivity.isConnected()) {
        books = await homeRemoteDatasource.fetchNewestBooks();
      } else {
        books = homeLocalDatasource.fetchNewestBooks();
      }
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
