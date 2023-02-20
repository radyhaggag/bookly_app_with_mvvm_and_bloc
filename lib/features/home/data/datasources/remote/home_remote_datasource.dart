import '../../models/book_model/book_model.dart';

abstract class HomeRemoteDatasource {
  Future<List<BookModel>> fetchNewestBooks();
  Future<List<BookModel>> fetchFeaturedBooks();
}
