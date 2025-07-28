import '../api/restful/ai_chat_api.dart';
import '../model/request/chat_completions_body.dart';

Future<void> main() async {
  var api = AiChatApi();

  // api.getChatCompletionsStream(
  //   body: ChatCompletionsBody(
  //     model: "deepseek-ai/DeepSeek-R1-0528-Qwen3-8B",
  //     messages: [
  //       MessageBody(
  //         role: "user",
  //         content: "你好"
  //       )
  //     ]
  //   ),
  //   onReceive: (result){
  //     print(result);
  //   }
  // );

  var response = await api.chatCompletions(
    ChatCompletionsBody(
      model: "deepseek-ai/DeepSeek-R1-0528-Qwen3-8B",
      messages: [
        MessageBody(
          role: "user",
          content: "你好"
        )
      ]
    )
  );

  print(response.choices?.first.message?.content);
}