// To parse this JSON data, do
//
//     final chatCompletionsStreamResult = chatCompletionsStreamResultFromJson(jsonString);

import 'dart:convert';

ChatCompletionsStreamResult chatCompletionsStreamResultFromJson(String str) => ChatCompletionsStreamResult.fromJson(json.decode(str));

String chatCompletionsStreamResultToJson(ChatCompletionsStreamResult data) => json.encode(data.toJson());

class ChatCompletionsStreamResult {
  String? id;
  String? object;
  int? created;
  String? model;
  List<Choice>? choices;
  String? systemFingerprint;
  Usage? usage;

  ChatCompletionsStreamResult({
    this.id,
    this.object,
    this.created,
    this.model,
    this.choices,
    this.systemFingerprint,
    this.usage,
  });

  factory ChatCompletionsStreamResult.fromJson(Map<String, dynamic> json) => ChatCompletionsStreamResult(
    id: json["id"],
    object: json["object"],
    created: json["created"],
    model: json["model"],
    choices: json["choices"] == null ? [] : List<Choice>.from(json["choices"]!.map((x) => Choice.fromJson(x))),
    systemFingerprint: json["system_fingerprint"],
    usage: json["usage"] == null ? null : Usage.fromJson(json["usage"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "object": object,
    "created": created,
    "model": model,
    "choices": choices == null ? [] : List<dynamic>.from(choices!.map((x) => x.toJson())),
    "system_fingerprint": systemFingerprint,
    "usage": usage?.toJson(),
  };
}

class Choice {
  int? index;
  Delta? delta;
  dynamic finishReason;
  ContentFilterResults? contentFilterResults;

  Choice({
    this.index,
    this.delta,
    this.finishReason,
    this.contentFilterResults,
  });

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
    index: json["index"],
    delta: json["delta"] == null ? null : Delta.fromJson(json["delta"]),
    finishReason: json["finish_reason"],
    contentFilterResults: json["content_filter_results"] == null ? null : ContentFilterResults.fromJson(json["content_filter_results"]),
  );

  Map<String, dynamic> toJson() => {
    "index": index,
    "delta": delta?.toJson(),
    "finish_reason": finishReason,
    "content_filter_results": contentFilterResults?.toJson(),
  };
}

class ContentFilterResults {
  Hate? hate;
  Hate? selfHarm;
  Hate? sexual;
  Hate? violence;

  ContentFilterResults({
    this.hate,
    this.selfHarm,
    this.sexual,
    this.violence,
  });

  factory ContentFilterResults.fromJson(Map<String, dynamic> json) => ContentFilterResults(
    hate: json["hate"] == null ? null : Hate.fromJson(json["hate"]),
    selfHarm: json["self_harm"] == null ? null : Hate.fromJson(json["self_harm"]),
    sexual: json["sexual"] == null ? null : Hate.fromJson(json["sexual"]),
    violence: json["violence"] == null ? null : Hate.fromJson(json["violence"]),
  );

  Map<String, dynamic> toJson() => {
    "hate": hate?.toJson(),
    "self_harm": selfHarm?.toJson(),
    "sexual": sexual?.toJson(),
    "violence": violence?.toJson(),
  };
}

class Hate {
  bool? filtered;

  Hate({
    this.filtered,
  });

  factory Hate.fromJson(Map<String, dynamic> json) => Hate(
    filtered: json["filtered"],
  );

  Map<String, dynamic> toJson() => {
    "filtered": filtered,
  };
}

class Delta {
  String? content;
  String? reasoningContent;
  String? role;

  Delta({
    this.content,
    this.reasoningContent,
    this.role,
  });

  factory Delta.fromJson(Map<String, dynamic> json) => Delta(
    content: json["content"],
    reasoningContent: json["reasoning_content"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "content": content,
    "reasoning_content": reasoningContent,
    "role": role,
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
