import 'package:flutter_admin/model/store/short_video.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/view/video_info.dart';

part 'short_video_store.g.dart';

@riverpod
class ShortVideoStore extends _$ShortVideoStore{
  @override
  ShortVideoList build() {
    return ShortVideoList();
  }

  void addNewVideos(List<VideoInfo> videoList){
    state = ShortVideoList(
      videoList: [...state.videoList, ...videoList],
      currentVideoIndex: state.currentVideoIndex,
    );
  }

  VideoInfo getCurrentVideo(){
    return state.videoList[state.currentVideoIndex];
  }

  VideoInfo gotoNextVideo(){
    state = ShortVideoList(
      videoList: state.videoList,
      currentVideoIndex: state.currentVideoIndex + 1,
    );
    return state.videoList[state.currentVideoIndex];
  }
}