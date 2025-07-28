import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../api/restful/ai_chat_api.dart';
import '../../store/ai_chat/ai_chat_store.dart';
import '../../model/request/chat_completions_body.dart';
import '../../model/response/chat_completions_stream_result.dart';
import '../../model/store/ai_chat.dart';

class AiChatService{
  final AiChatApi aiChatApi = AiChatApi();
  late var aiChatHistory;
  late var aiChatHistoryNotifier; 

  AiChatService(WidgetRef ref){
    aiChatHistory = ref.watch(aiChatHistoryStoreProvider);
    aiChatHistoryNotifier = ref.watch(aiChatHistoryStoreProvider.notifier);
  }

  /*
   在已有会话基础上进行聊天
  */
  void makeNewChat(
    {
      required Session session,
      required content,
      required bool isDeepThink,
      required bool isInternetSearch,
    }
  ){
    bool isContentFected = false;
    aiChatApi.getChatCompletionsStream(
      body: ChatCompletionsBody(
        model: isDeepThink?"deepseek-ai/DeepSeek-R1-Distill-Qwen-32B":"deepseek-ai/DeepSeek-R1-0528-Qwen3-8B",
        messages: [
          for(var messgae in session.messages)
            MessageBody(
              role: messgae.role,
              content: messgae.content
            )
        ]
      ),
      onReceive: (ChatCompletionsStreamResult result){
        String? deltaReasoningContent = result.choices?.first.delta?.reasoningContent;
        String? deltaContent = result.choices?.first.delta?.content;
        var content = session.messages.last.content;
        if(deltaReasoningContent != null){ 
          if(!isContentFected){ 
            content = "";
            isContentFected = true;
          }
          content += deltaReasoningContent;
        }
        else if(deltaContent != null){
          if(!isContentFected){
            content = "";
            isContentFected = true;
          }
          content += deltaContent;
        }
        session.messages.last.content = content.trimLeft();
        aiChatHistoryNotifier.updateSession(session);
      },
    );
  }

  /*
    重命名已有会话的标题
  */
  void renameNewChat(
    {
      required Session session,
      required String content,
    }
  ){
    var isTitleFected = false;
    aiChatApi.getChatCompletionsStream(
      body: ChatCompletionsBody(
        model: "deepseek-ai/DeepSeek-R1-0528-Qwen3-8B",
        messages: [
          MessageBody(
            role: 'system',
            content: '请你根据用户的问题，总结字数不超过20字的短语'
          ),
          MessageBody(
            role: "user",
            content: content
          )
        ]
      ),
      onReceive: (ChatCompletionsStreamResult result){
        String? deltaContent = result.choices?.first.delta?.content;
        var title = session.title;
        if(deltaContent != null){
          if(!isTitleFected && deltaContent.isNotEmpty){
            title = "";
            isTitleFected = true;
          }
          title += deltaContent;
        }
        session.title = title.trim();
        aiChatHistoryNotifier.updateSession(session);
      }
    );
  }
}