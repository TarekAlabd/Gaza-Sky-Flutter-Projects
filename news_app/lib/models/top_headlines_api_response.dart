import 'package:news_app/models/article.dart';

class TopHeadlinesApiResponse {
  final String status;
  final int? totalResults;
  final String? code;
  final String? message;
  final List<Article>? articles;

  const TopHeadlinesApiResponse({
    required this.status,
    this.totalResults,
    this.code,
    this.message,
    this.articles,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'status': status});
    if(totalResults != null){
      result.addAll({'totalResults': totalResults});
    }
    if(code != null){
      result.addAll({'code': code});
    }
    if(message != null){
      result.addAll({'message': message});
    }
    if(articles != null){
      result.addAll({'articles': articles!.map((x) => x.toMap()).toList()});
    }
  
    return result;
  }

  factory TopHeadlinesApiResponse.fromMap(Map<String, dynamic> map) {
    return TopHeadlinesApiResponse(
      status: map['status'] ?? '',
      totalResults: map['totalResults']?.toInt(),
      code: map['code'],
      message: map['message'],
      articles: map['articles'] != null ? List<Article>.from(map['articles']?.map((x) => Article.fromMap(x))) : null,
    );
  }
}
