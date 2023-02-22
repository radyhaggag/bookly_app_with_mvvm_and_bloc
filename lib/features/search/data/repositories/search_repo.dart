import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/models/book_model.dart';
import '../models/search_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> search(SearchModel searchModel);
}
