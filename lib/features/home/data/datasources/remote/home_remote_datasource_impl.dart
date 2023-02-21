import '../../../../../core/api/api_service.dart';
import '../../models/book_model/book_model.dart';

import 'home_remote_datasource.dart';

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  HomeRemoteDatasourceImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<List<BookModel>> fetchFeaturedBooks() async {
    try {
      final data = await apiService.get(
        endpoint: 'volumes?q=Programming',
      );
      List<BookModel> books = [];
      books = List<BookModel>.from(
        data['items'].map((book) => BookModel.fromJson(book)),
      );
      return books;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<BookModel>> fetchNewestBooks() async {
    try {
      final data = await apiService.get(
        endpoint: 'volumes?q=Programming&orderBy=newest',
      );
      List<BookModel> books = [];
      books = List<BookModel>.from(
        data['items'].map((book) => BookModel.fromJson(book)),
      );
      return books;
    } catch (e) {
      rethrow;
    }
  }
}
