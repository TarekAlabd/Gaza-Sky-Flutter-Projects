class PaymentMethodModel {
  final String id;
  final String imgUrl;
  final String name;
  final String cardNumber;
  final String expiryDate;
  final String cvv;
  final String cardHolderName;
  final bool isFav;

  const PaymentMethodModel({
    this.imgUrl =
        'https://raw.githubusercontent.com/Houssem-Selmi/flutter-credit-card/master/assets/images/mastercard.png',
    this.name = 'Master Card',
    required this.id,
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
    required this.cardHolderName,
    required this.isFav,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'imgUrl': imgUrl});
    result.addAll({'name': name});
    result.addAll({'cardNumber': cardNumber});
    result.addAll({'expiryDate': expiryDate});
    result.addAll({'cvv': cvv});
    result.addAll({'cardHolderName': cardHolderName});
    result.addAll({'isFav': isFav});

    return result;
  }

  factory PaymentMethodModel.fromMap(Map<String, dynamic> map) {
    return PaymentMethodModel(
      id: map['id'] ?? '',
      imgUrl: map['imgUrl'] ?? '',
      name: map['name'] ?? '',
      cardNumber: map['cardNumber'] ?? '',
      expiryDate: map['expiryDate'] ?? '',
      cvv: map['cvv'] ?? '',
      isFav: map['isFav'] ?? '',
      cardHolderName: map['cardHolderName'] ?? '',
    );
  }
}
