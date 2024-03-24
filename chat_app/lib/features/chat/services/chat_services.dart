import 'package:chat_app/core/services/firestore_services.dart';
import 'package:chat_app/core/utils/api_path.dart';
import 'package:chat_app/features/chat/models/message_model.dart';

class ChatServices {
  final _firestoreServices = FirestoreService.instance;

  Future<void> sendMessage(MessageModel message) async {
    try {
      await _firestoreServices.setData(
        path: ApiPath.sendMessage(message.id),
        data: message.toMap(),
      );
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<MessageModel>> getMessages() {
    try {
      return _firestoreServices.collectionStream(
        path: ApiPath.messages(),
        builder: (data, documentId) => MessageModel.fromMap(data),
      );
    } catch (e) {
      rethrow;
    }
  }
}
