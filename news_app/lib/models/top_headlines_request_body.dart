class TopHeadlinesRequestBody {
  final String country;
  final String? category;
  final String? sources;
  final String? q;
  final int? pageSize;
  final int? page;

  TopHeadlinesRequestBody({
    required this.country,
    this.category,
    this.sources,
    this.q,
    this.pageSize,
    this.page,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'country': country});
    if(category != null){
      result.addAll({'category': category});
    }
    if(sources != null){
      result.addAll({'sources': sources});
    }
    if(q != null){
      result.addAll({'q': q});
    }
    if(pageSize != null){
      result.addAll({'pageSize': pageSize});
    }
    if(page != null){
      result.addAll({'page': page});
    }
  
    return result;
  }

  factory TopHeadlinesRequestBody.fromMap(Map<String, dynamic> map) {
    return TopHeadlinesRequestBody(
      country: map['country'] ?? '',
      category: map['category'],
      sources: map['sources'],
      q: map['q'],
      pageSize: map['pageSize']?.toInt(),
      page: map['page']?.toInt(),
    );
  }
}
