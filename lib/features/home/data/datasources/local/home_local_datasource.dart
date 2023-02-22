import '../../../../../core/models/book_model.dart';

abstract class HomeLocalDatasource {
  List<BookModel> fetchNewestBooks();
  List<BookModel> fetchFeaturedBooks();
}
