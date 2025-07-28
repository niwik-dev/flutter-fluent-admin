// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p_chat_bubble.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key? key,
    required this.text,
    this.isUser = false,
  }) : super(key: key);

  final String text;

  final bool isUser;

  @override
  Widget build(BuildContext _context) => chatBubble(
        _context,
        text: text,
        isUser: isUser,
      );
}
