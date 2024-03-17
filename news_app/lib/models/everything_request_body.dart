class EverythingRequestBody {
  final String q;
  final String searchIn;

  EverythingRequestBody({
    required this.q,
    required this.searchIn,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'q': q});
    result.addAll({'searchIn': searchIn});
  
    return result;
  }

  factory EverythingRequestBody.fromMap(Map<String, dynamic> map) {
    return EverythingRequestBody(
      q: map['q'] ?? '',
      searchIn: map['searchIn'] ?? '',
    );
  }
}
