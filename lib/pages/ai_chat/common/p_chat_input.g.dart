// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p_chat_input.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class ChatInput extends HookWidget {
  const ChatInput({
    Key? key,
    required this.onNewChat,
  }) : super(key: key);

  final dynamic Function(
    String,
    bool,
    bool,
  ) onNewChat;

  @override
  Widget build(BuildContext _context) => chatInput(
        _context,
        onNewChat: onNewChat,
      );
}
