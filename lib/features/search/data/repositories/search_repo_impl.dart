import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/models/book_model.dart';
import '../datasources/remote/search/search_remote_datasource.dart';
import '../models/search_model.dart';
import 'search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  SearchRepoImpl(this.remoteDatasource);

  final SearchRemoteDatasource remoteDatasource;

  @override
  Future<Either<Failure, List<BookModel>>> search(
    SearchModel searchModel,
  ) async {
    try {
      final books = await remoteDatasource.search(
        searchModel,
      );
      return right(books);
    } catch (e) {
      return left(ErrorHandler.handle(e).failure);
    }
  }
}
