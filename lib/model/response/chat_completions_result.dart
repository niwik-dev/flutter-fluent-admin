// To parse this JSON data, do
//
//     final chatCompletionsResult = chatCompletionsResultFromJson(jsonString);

import 'dart:convert';

ChatCompletionsResult chatCompletionsResultFromJson(String str) => ChatCompletionsResult.fromJson(json.decode(str));

String chatCompletionsResultToJson(ChatCompletionsResult data) => json.encode(data.toJson());

class ChatCompletionsResult {
  String? id;
  List<Choice>? choices;
  Usage? usage;
  int? created;
  String? model;
  String? object;

  ChatCompletionsResult({
    this.id,
    this.choices,
    this.usage,
    this.created,
    this.model,
    this.object,
  });

  factory ChatCompletionsResult.fromJson(Map<String, dynamic> json) => ChatCompletionsResult(
    id: json["id"],
    choices: json["choices"] == null ? [] : List<Choice>.from(json["choices"]!.map((x) => Choice.fromJson(x))),
    usage: json["usage"] == null ? null : Usage.fromJson(json["usage"]),
    created: json["created"],
    model: json["model"],
    object: json["object"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "choices": choices == null ? [] : List<dynamic>.from(choices!.map((x) => x.toJson())),
    "usage": usage?.toJson(),
    "created": created,
    "model": model,
    "object": object,
  };
}

class Choice {
  Message? message;
  String? finishReason;

  Choice({
    this.message,
    this.finishReason,
  });

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
    message: json["message"] == null ? null : Message.fromJson(json["message"]),
    finishReason: json["finish_reason"],
  );

  Map<String, dynamic> toJson() => {
    "message": message?.toJson(),
    "finish_reason": finishReason,
  };
}

class Message {
  String? role;
  String? content;
  String? reasoningContent;

  Message({
    this.role,
    this.content,
    this.reasoningContent,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    role: json["role"],
    content: json["content"],
    reasoningContent: json["reasoning_content"],
  );

  Map<String, dynamic> toJson() => {
    "role": role,
    "content": content,
    "reasoning_content": reasoningContent,
  };
}

class Usage {
  int? promptTokens;
  int? completionTokens;
  int? totalTokens;

  Usage({
    this.promptTokens,
    this.completionTokens,
    this.totalTokens,
  });

  factory Usage.fromJson(Map<String, dynamic> json) => Usage(
    promptTokens: json["prompt_tokens"],
    completionTokens: json["completion_tokens"],
    totalTokens: json["total_tokens"],
  );

  Map<String, dynamic> toJson() => {
    "prompt_tokens": promptTokens,
    "completion_tokens": completionTokens,
    "total_tokens": totalTokens,
  };
}
