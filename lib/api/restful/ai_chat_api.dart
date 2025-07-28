import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../model/request/chat_completions_body.dart';
import '../../model/response/chat_completions_result.dart';
import '../../model/response/chat_completions_stream_result.dart';

class AiChatApi {
  // 单例模式
  static final AiChatApi _instance = AiChatApi._internal();
  factory AiChatApi() => _instance;
  AiChatApi._internal();

  static const String baseUrl = "https://api.siliconflow.cn";
  static const String apiKey = "sk-wqwmklrlmklbgxhlupelbugpjaexoqsitcdzcjtevwksxzkl";

  static bool isClientInitialized = false;
  static late Dio httpClient;

  Dio getClient(){
    if (!isClientInitialized) {
      httpClient = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          responseType: ResponseType.json,
          validateStatus: (status) {
            return true;
          },
          headers: {
            "Authorization": "Bearer $apiKey",
          },
        ),
      );
      isClientInitialized = true;
     }
    return httpClient;
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    final response = await getClient().get(
      path,
      queryParameters: queryParameters,
    );
    return response;
  }

  Future<Response> post(String path, {Map<String, dynamic>? queryParameters, Map<String, dynamic>? data}) async {
    final response = await getClient().post<Map<String, dynamic>>(
      path,
      data: data,
    );
    return response;
  }

  Future<Response> postStream(String path, {Map<String, dynamic>? queryParameters, Map<String, dynamic>? data}) async {
    final response = await getClient().post<ResponseBody>(
      path,
      queryParameters: queryParameters,
      data: data,
      options: Options(
        responseType: ResponseType.stream,
      ),
    );
    return response;
  }

  Future<ChatCompletionsResult> chatCompletions(ChatCompletionsBody body) async {
    body.stream = false;
    final response = await post("/v1/chat/completions", data: body.toJson());
    Map<String,dynamic> responseData = response.data;
    if (response.statusCode == 200) {
      return ChatCompletionsResult.fromJson(responseData);
    } else {
      throw Exception('Cannot get chat completions');
    }
  }

  Future<void> getChatCompletionsStream({
    required ChatCompletionsBody body,
    required Function(ChatCompletionsStreamResult) onReceive,
    Function()? onFinished
  }) async {
    body.stream = true;
    final response = await postStream("/v1/chat/completions", data: body.toJson());

    StreamTransformer<Uint8List, List<int>> unit8Transformer =
    StreamTransformer.fromHandlers(
      handleData: (data, sink) {
        sink.add(List<int>.from(data));
      },
    );

    if(response.statusCode == 200) {
      await for(
          String line in response.data?.stream?.transform(unit8Transformer)
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
      ){
        if(line.startsWith("data: [DONE]")){
          if(onFinished != null){
            onFinished();
          }
          break;
        }
        if(line.startsWith("data: ")){
          line = line.substring(6);
          ChatCompletionsStreamResult result = ChatCompletionsStreamResult.fromJson(jsonDecode(line));
          onReceive(result);
        }
      }
    }
  }
}