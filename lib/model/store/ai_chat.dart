import 'package:uuid/uuid.dart';

class SessionMessage {
  String? role;
  String content;
  String? reasoningContent;

  SessionMessage copy(){
    return SessionMessage(
      role: role,
      content: content,
      reasoningContent: reasoningContent,
    );
  }

  SessionMessage({
    this.role,
    this.content = "",
    this.reasoningContent,
  });
}

class Session{
  late String uuid;
  late DateTime createTime;
  late DateTime updateTime;

  String title;
  List<SessionMessage> messages;

  Session({
    required this.title,
    required this.messages
  }){
    uuid = const Uuid().v4();
    createTime = DateTime.now();
    updateTime = DateTime.now();
  }

  Session copy(){
    return Session(
      title: title,
      messages: [
        for(var message in messages)
          message.copy(),
      ],
    );
  }

  void addMessages(List<SessionMessage> newMessages){
    messages.addAll(newMessages);
  }

  void addMessage(SessionMessage message) {
    messages.add(message);
  }

  void removeMessage(SessionMessage message) {
    messages.remove(message);
  }
}