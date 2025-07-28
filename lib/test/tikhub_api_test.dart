import 'package:flutter_admin/api/restful/tikhub_api.dart';
import 'package:flutter_admin/service/short_video/short_video_service.dart';

Future<void> main() async {
  ShortVideoService shortVideoService = ShortVideoService();
  var videos = await shortVideoService.getDouYinVideo();
  for (var video in videos) {
    print(video.videoUrl);
  }
}