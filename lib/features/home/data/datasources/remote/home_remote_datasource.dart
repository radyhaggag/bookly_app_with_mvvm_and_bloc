import '../../../../../core/models/book_model.dart';

abstract class HomeRemoteDatasource {
  Future<List<BookModel>> fetchNewestBooks();
  Future<List<BookModel>> fetchFeaturedBooks();
  Future<List<BookModel>> fetchSimilarBooks(String category);
}
