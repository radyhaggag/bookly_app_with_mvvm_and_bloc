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
      String sortOption = _validateSortOption(searchModel.sortOption);
      String filterOption = _validateFilterOption(searchModel.filterOption);
      final data = await apiService.get(
        endpoint:
            'volumes?q=${searchModel.searchText}&orderBy=$sortOption&filter=$filterOption',
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

  String _validateSortOption(String? sortOption) {
    if (sortOption == null || sortOption.isEmpty) {
      return 'newest';
    } else {
      return sortOption;
    }
  }

  String _validateFilterOption(String? filterOption) {
    if (filterOption == null || filterOption.isEmpty) {
      return 'ebooks';
    } else {
      return filterOption;
    }
  }
}
