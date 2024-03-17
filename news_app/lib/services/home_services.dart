import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/models/top_headlines_api_response.dart';
import 'package:news_app/models/top_headlines_request_body.dart';
import 'package:news_app/utils/app_constants.dart';

class HomeServices {
  final dio = Dio();

  Future<List<Article>?> getTopHeadlines(
      {required TopHeadlinesRequestBody requestBody}) async {
    try {
      final apiHeaders = {
        'X-Api-Key': AppConstants.apiKey,
      };
      final response = await dio.get(
        AppConstants.topHeadlines,
        queryParameters: requestBody.toMap(),
        options: Options(
          headers: apiHeaders,
        ),
      );
      debugPrint(response.toString());
      final topHeadlines = TopHeadlinesApiResponse.fromMap(response.data);
      return topHeadlines.articles;
    } catch (e) {
      rethrow;
    }
  }
}
