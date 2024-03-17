import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/models/everything_request_body.dart';
import 'package:news_app/services/search_services.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  final _searchServices = SearchServices();

  Future<void> searchArticles(String query) async {
    emit(SearchLoading());
    try {
      final articles = await _searchServices.getSearchResults(
        EverythingRequestBody(q: query, searchIn: 'title'),
      );
      emit(SearchLoaded(articles!));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
