import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/models/book_model.dart';
import '../../../models/search_model.dart';
import 'search_remote_datasource.dart';

class SearchRemoteDatasourceImpl implements SearchRemoteDatasource {
  SearchRemoteDatasourceImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<List<BookModel>> search(
    SearchModel searchModel,
  ) async {
    try {
      final data = await apiService.get(
        endpoint:
            'volumes?q=${searchModel.searchText}&orderBy=${searchModel.sortOption}&filter=${searchModel.filterOption}',
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
