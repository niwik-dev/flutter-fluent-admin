// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_chat_page.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class AiChatPage extends HookConsumerWidget {
  const AiChatPage({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      aiChatPage(
        _context,
        _ref,
      );
}

class ChatNewSubPage extends StatelessWidget {
  const ChatNewSubPage({
    Key? key,
    required this.onNewChat,
  }) : super(key: key);

  final dynamic Function(
    String,
    bool,
    bool,
  ) onNewChat;

  @override
  Widget build(BuildContext _context) => chatNewSubPage(
        _context,
        onNewChat: onNewChat,
      );
}

/// 聊天历史界面 子页面
class ChatHistorySubPage extends HookConsumerWidget {
  /// 聊天历史界面 子页面
  const ChatHistorySubPage(
    this.sessionUuidId, {
    Key? key,
  }) : super(key: key);

  /// 聊天历史界面 子页面
  final String sessionUuidId;

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      chatHistorySubPage(
        _context,
        _ref,
        sessionUuidId,
      );
}
