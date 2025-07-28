import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_admin/model/request/fetch_video_comment_body.dart';
import 'package:flutter_admin/model/response/fetch_home_feed.dart';
import 'package:flutter_admin/model/response/fetch_video_comment.dart';

import '../../model/request/fetch_home_feed_params.dart';

class DouYinWebApi{
  // 单例模式
  static final DouYinWebApi _instance = DouYinWebApi._internal();
  factory DouYinWebApi() => _instance;
  DouYinWebApi._internal();

  static const String baseUrl = "https://api.tikhub.io";
  static const String authToken = "9LY1bDt1nUYOngokzlWRtksewQlQtsWcqK9jzzi4kENRqm5QR6Bj+y2xXw==";

  static bool isClientInitialized = false;
  static late Dio httpClient;

  Dio getClient(){
    if(!isClientInitialized){
      httpClient = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          responseType: ResponseType.json,
          validateStatus: (status) {
            return true;
          },
          headers: {
            "Authorization": "Bearer $authToken",
          },
        ),
      );
      httpClient.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          return HttpClient()
            ..findProxy = (url) {
              return "PROXY 127.0.0.1:7890";
            };
        }
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

  // 获取首页推荐数据
  Future<FetchHomeFeedResponse> fecthHomeFeed({
    required int count,
    required int freshIndex
  }) async {
    String url = "/api/v1/douyin/web/fetch_home_feed";
    final response = await get(
      url,
      queryParameters: FetchHomeFeedParams(
        count: count,
        freshIndex: freshIndex,
      ).toJson(),
    );

    final result = FetchHomeFeedResponse.fromJson(response.data["data"]);
    return result;
  }

  Future<FetchVideoCommentsResponse> fetchVideoComments({
    required String awemeId,
    int cursor = 0,
    int count = 20,
  }) async {
    String url = "/api/v1/douyin/web/fetch_video_comments";
    final response = await post(
      url,
      data: FetchVideoCommentBody(
        awemeId: awemeId,
        cursor: cursor,
        count: count,
      ).toJson()
    );
    final result = FetchVideoCommentsResponse.fromJson(response.data["data"]);
    return result;
  }

}

class DouYinBillboardApi{ 
  // 单例模式
  static final DouYinBillboardApi _instance = DouYinBillboardApi._internal();
  factory DouYinBillboardApi() => _instance;
  DouYinBillboardApi._internal();


}

class RedNoteWebApi{
  // 单例模式
  static final RedNoteWebApi _instance = RedNoteWebApi._internal();
  factory RedNoteWebApi() => _instance;
  RedNoteWebApi._internal();


}