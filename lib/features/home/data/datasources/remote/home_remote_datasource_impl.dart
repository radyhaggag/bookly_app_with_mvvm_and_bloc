import 'package:bookly_app/core/config/hive_manager.dart';
import 'package:hive/hive.dart';

import '../../../../../core/api/api_service.dart';

import '../../../../../core/models/book_model.dart';
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
      Hive.box(HiveBoxes.featuredBooks).clear();
      Hive.box(HiveBoxes.featuredBooks).addAll(books);
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
      Hive.box(HiveBoxes.newestBooks).clear();
      Hive.box(HiveBoxes.newestBooks).addAll(books);

      return books;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<BookModel>> fetchSimilarBooks(String category) async {
    try {
      final data = await apiService.get(
        endpoint:
            'volumes?q=Programming+intitle:$category&orderBy=relevance&filter=ebooks',
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
