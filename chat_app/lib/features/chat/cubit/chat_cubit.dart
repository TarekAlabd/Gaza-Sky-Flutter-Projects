import 'package:chat_app/core/services/user_services.dart';
import 'package:chat_app/features/chat/services/chat_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app/features/chat/models/message_model.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  final chatServices = ChatServices();
  final userServices = UserServices();

  Future<void> sendMessage(String text) async {
    emit(ChatMessageSending());
    try {
      final sender = await userServices.getUser();
      final message = MessageModel(
        id: DateTime.now().toIso8601String(),
        senderId: sender.id,
        senderName: sender.username,
        senderPhotoUrl: sender.photoUrl,
        message: text,
        dateTime: DateTime.now(),
      );

      await chatServices.sendMessage(message);
      emit(ChatMessageSent());
    } catch (e) {
      emit(ChatMessageSendFailure(e.toString()));
    }
  }

  Future<void> getMessages() async {
    emit(ChatLoading());
    try {
      final messagesStream = chatServices.getMessages();

      messagesStream.listen((messages) {
        emit(ChatSuccess(messages));
      });
    } catch (e) {
      emit(ChatFailure(e.toString()));
    }
  }
}
