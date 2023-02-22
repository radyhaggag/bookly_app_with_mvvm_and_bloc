import '../../../../../core/config/hive_manager.dart';
import '../../../../../core/models/book_model.dart';
import 'home_local_datasource.dart';

class HomeLocalDatasourceImpl implements HomeLocalDatasource {
  @override
  List<BookModel> fetchFeaturedBooks() {
    try {
      final books = AppHiveBoxes.featuredBooks.values.toList();
      return books;
    } catch (e) {
      rethrow;
    }
  }

  @override
  List<BookModel> fetchNewestBooks() {
    try {
      final books = AppHiveBoxes.newestBooks.values.toList();
      return books;
    } catch (e) {
      rethrow;
    }
  }
}
