part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}

final class ChatLoading extends ChatState {}

final class ChatSuccess extends ChatState {
  final List<MessageModel> messages;

  ChatSuccess(this.messages);
}

final class ChatFailure extends ChatState {
  final String message;

  ChatFailure(this.message);
}

final class ChatMessageSent extends ChatState {}

final class ChatMessageSending extends ChatState {}

final class ChatMessageSendFailure extends ChatState {
  final String message;

  ChatMessageSendFailure(this.message);
}