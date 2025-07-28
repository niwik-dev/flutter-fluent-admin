import 'package:flutter_admin/model/view/video_info.dart';

class ShortVideoList{
  List<VideoInfo> videoList = [];
  int currentVideoIndex = 0;

  ShortVideoList({
    this.videoList = const [],
    this.currentVideoIndex = 0,
  });
}