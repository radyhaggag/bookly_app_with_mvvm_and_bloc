import 'package:hive/hive.dart';

import '../../../../../core/config/hive_manager.dart';
import '../../../../../core/models/book_model.dart';
import 'home_local_datasource.dart';

class HomeLocalDatasourceImpl implements HomeLocalDatasource {
  @override
  List<BookModel> fetchFeaturedBooks() {
    try {
      final data = Hive.box(HiveBoxes.featuredBooks).values;
      List<BookModel> books = [];
      books = List<BookModel>.from(
        data.map((book) => BookModel.fromJson(book)),
      );
      return books;
    } catch (e) {
      rethrow;
    }
  }

  @override
  List<BookModel> fetchNewestBooks() {
    try {
      final data = Hive.box(HiveBoxes.featuredBooks).values;
      List<BookModel> books = [];
      books = List<BookModel>.from(
        data.map((book) => BookModel.fromJson(book)),
      );
      return books;
    } catch (e) {
      rethrow;
    }
  }
}
