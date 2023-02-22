import 'package:bookly_app/features/search/data/models/search_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/models/book_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> search(SearchModel searchModel);
}
