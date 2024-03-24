class MessageModel {
  final String id;
  final String senderId;
  final String senderName;
  final String senderPhotoUrl;
  final String message;
  final DateTime dateTime;

  MessageModel({
    required this.id,
    required this.senderId,
    required this.senderName,
    required this.senderPhotoUrl,
    required this.message,
    required this.dateTime,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'senderId': senderId});
    result.addAll({'senderName': senderName});
    result.addAll({'senderPhotoUrl': senderPhotoUrl});
    result.addAll({'message': message});
    result.addAll({'dateTime': dateTime.millisecondsSinceEpoch});
  
    return result;
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] ?? '',
      senderId: map['senderId'] ?? '',
      senderName: map['senderName'] ?? '',
      senderPhotoUrl: map['senderPhotoUrl'] ?? '',
      message: map['message'] ?? '',
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime']),
    );
  }
}
