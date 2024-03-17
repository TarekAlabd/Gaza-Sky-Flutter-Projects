import 'package:dio/dio.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/models/everything_request_body.dart';
import 'package:news_app/models/top_headlines_api_response.dart';
import 'package:news_app/utils/app_constants.dart';

class SearchServices {
  final dio = Dio();
  Future<List<Article>?> getSearchResults(
      EverythingRequestBody requestBody) async {
    try {
      final apiHeaders = {
        'X-Api-Key': AppConstants.apiKey,
      };
      final response = await dio.get(
        AppConstants.everything,
        queryParameters: requestBody.toMap(),
        options: Options(headers: apiHeaders),
      );
      final result = TopHeadlinesApiResponse.fromMap(response.data);
      return result.articles;
    } catch (e) {
      rethrow;
    }
  }
}
