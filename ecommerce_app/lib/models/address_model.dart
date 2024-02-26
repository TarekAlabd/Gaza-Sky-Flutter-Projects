class AddressModel {
  final String id;
  final String imgUrl;
  final String name;
  final String address;
  final bool isFav;

  const AddressModel({
    required this.id,
    required this.imgUrl,
    required this.name,
    required this.address,
    required this.isFav,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'imgUrl': imgUrl});
    result.addAll({'name': name});
    result.addAll({'address': address});
    result.addAll({'isFav': isFav});

    return result;
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id: map['id'] ?? '',
      imgUrl: map['imgUrl'] ?? '',
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      isFav: map['isFav'] ?? '',
    );
  }
}
