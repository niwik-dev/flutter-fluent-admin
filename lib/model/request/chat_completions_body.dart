// To parse this JSON data, do
//
//     final chatParam = chatParamFromJson(jsonString);

import 'dart:convert';

ChatCompletionsBody chatParamFromJson(String str) => ChatCompletionsBody.fromJson(json.decode(str));

String chatParamToJson(ChatCompletionsBody data) => json.encode(data.toJson());

class ChatCompletionsBody {
  String? model;
  List<MessageBody>? messages;
  bool stream;
  int? maxTokens;
  List? stop;
  double? temperature;
  double? topP;
  int? topK;
  double? frequencyPenalty;
  int? n;

  ChatCompletionsBody({
    this.model,
    this.messages,
    this.stream=false,
    this.maxTokens=2048,
    this.stop,
    this.temperature=0.7,
    this.topP=0.7,
    this.topK=50,
    this.frequencyPenalty=0.5,
    this.n=1,
  });

  factory ChatCompletionsBody.fromJson(Map<String, dynamic> json) => ChatCompletionsBody(
    model: json["model"],
    messages: json["messages"] == null ? [] : List<MessageBody>.from(json["messages"]!.map((x) => MessageBody.fromJson(x))),
    stream: json["stream"],
    maxTokens: json["max_tokens"],
    stop: json["stop"]??[],
    temperature: json["temperature"]?.toDouble(),
    topP: json["top_p"]?.toDouble(),
    topK: json["top_k"],
    frequencyPenalty: json["frequency_penalty"]?.toDouble(),
    n: json["n"],
  );

  Map<String, dynamic> toJson() => {
    "model": model,
    "messages": messages == null ? [] : List<dynamic>.from(messages!.map((x) => x.toJson())),
    "stream": stream,
    "max_tokens": maxTokens,
    "stop": stop??[],
    "temperature": temperature,
    "top_p": topP,
    "top_k": topK,
    "frequency_penalty": frequencyPenalty,
    "n": n,
  };
}

class MessageBody {
  String? role;
  String? content;

  MessageBody({
    this.role,
    this.content,
  });

  factory MessageBody.fromJson(Map<String, dynamic> json) => MessageBody(
    role: json["role"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "role": role,
    "content": content,
  };
}
