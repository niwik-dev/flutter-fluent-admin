import 'package:dio/dio.dart';

import '../api/restful/tikhub_api.dart';
import '../service/short_video/short_video_service.dart';
import '../service/short_video/douyin_service.dart';

Future<void> main() async {
  // DouYinWebApi douYinWebApi = DouYinWebApi();
  // final fetchHomeFeed = await douYinWebApi.fecthHomeFeed(count: 1, freshIndex: 1);
  // print(fetchHomeFeed.toJson()); 
  DouYinWebService shortVideoService = DouYinWebService();
  final videoList = await shortVideoService.getDouYinVideo();
  print(videoList);
}