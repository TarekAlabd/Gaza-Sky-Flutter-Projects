import 'package:news_app/models/source.dart';

class Article {
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(source != null){
      result.addAll({'source': source!.toMap()});
    }
    if(author != null){
      result.addAll({'author': author});
    }
    if(title != null){
      result.addAll({'title': title});
    }
    if(description != null){
      result.addAll({'description': description});
    }
    if(url != null){
      result.addAll({'url': url});
    }
    if(urlToImage != null){
      result.addAll({'urlToImage': urlToImage});
    }
    if(publishedAt != null){
      result.addAll({'publishedAt': publishedAt});
    }
    if(content != null){
      result.addAll({'content': content});
    }
  
    return result;
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      source: map['source'] != null ? Source.fromMap(map['source']) : null,
      author: map['author'],
      title: map['title'],
      description: map['description'],
      url: map['url'],
      urlToImage: map['urlToImage'],
      publishedAt: map['publishedAt'],
      content: map['content'],
    );
  }
}
