import 'package:chat_app/core/utils/route/app_routes.dart';
import 'package:chat_app/features/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:chat_app/features/chat/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ChatCubit>(context);
    final authCubit = BlocProvider.of<AuthCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () async {
              await authCubit.logout();
            },
          ),
        ],
      ),
      body: BlocListener<AuthCubit, AuthState>(
        bloc: authCubit,
        listenWhen: (previous, current) => current is AuthLoggedOut,
        listener: (context, state) {
          if (state is AuthLoggedOut) {
            Navigator.of(context).pushReplacementNamed(AppRoutes.login);
          }
        },
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<ChatCubit, ChatState>(
                  bloc: cubit,
                  buildWhen: (previous, current) =>
                      current is ChatSuccess || current is ChatFailure,
                  builder: (context, state) {
                    if (state is ChatSuccess) {
                      if (state.messages.isEmpty) {
                        return const Center(
                          child: Text('No messages'),
                        );
                      }
                      return ListView.builder(
                        itemCount: state.messages.length,
                        itemBuilder: (context, index) {
                          final message = state.messages[index];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                message.senderPhotoUrl,
                              ),
                              radius: 40,
                            ),
                            title: Text(message.message),
                            subtitle: Text(message.senderName),
                          );
                        },
                      );
                    } else if (state is ChatFailure) {
                      return Center(
                        child: Text(state.message),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              TextField(
                controller: _messageController,
                decoration: InputDecoration(
                  hintText: 'Type a message',
                  border: const OutlineInputBorder(),
                  suffixIcon: BlocConsumer<ChatCubit, ChatState>(
                    bloc: cubit,
                    listenWhen: (previous, current) =>
                        current is ChatMessageSent,
                    listener: (context, state) {
                      if (state is ChatMessageSent) {
                        _messageController.clear();
                      }
                    },
                    buildWhen: (previous, current) =>
                        current is ChatMessageSending ||
                        current is ChatMessageSent,
                    builder: (context, state) {
                      if (state is ChatMessageSending) {
                        return const CircularProgressIndicator.adaptive();
                      }
                      return IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () async {
                          await cubit.sendMessage(_messageController.text);
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
