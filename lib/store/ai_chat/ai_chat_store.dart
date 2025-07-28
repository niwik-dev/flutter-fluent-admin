import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/store/ai_chat.dart';

part 'ai_chat_store.g.dart';

@riverpod
class AiChatHistoryStore extends _$AiChatHistoryStore{
  @override
  List<Session> build() {
    return <Session>[];
  }

  void orderByCreateTime(){
    state = state..sort((a, b) => b.createTime.compareTo(a.createTime));
  }

  void saveSession(Session session){
    bool isExist = false;
    for(var i = 0; i < state.length; i++){
      if(state[i].uuid == session.uuid){
        isExist = true;
        break;
      }
    }
    if(!isExist){
      addSession(session);
    }else{
      updateSession(session);
    }
  }

  List<Session> getSessions() {
    return state;
  }

  void addSession(Session session) {
    state = [session,...state];
    orderByCreateTime();
  }

  void removeSession(Session session) {
    state = state.where(
      (element) => element.uuid != session.uuid
    ).toList();
  }
  
  void updateSession(Session session) {
    state = state.map(
      (element) => element.uuid == session.uuid ? session : element
    ).toList();
  }

  Session? getSession(String uuid) {
    return state.where(
      (element) => element.uuid == uuid
    ).firstOrNull;
  }
}