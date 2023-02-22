import '../../../../../../core/models/book_model.dart';
import '../../../models/search_model.dart';

abstract class SearchRemoteDatasource {
  Future<List<BookModel>> search(SearchModel searchModel);
}
