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

  // 获取当前视频
  VideoInfo? getCurrentVideo(){
    if(state.videoList.isEmpty){
      return null;
    }
    return state.videoList[state.currentVideoIndex];
  }

  // 获取上一个视频
  VideoInfo getPrevVideo() {
    return state.videoList[state.currentVideoIndex - 1];
  }
  
  // 获取下一个视频
  VideoInfo getNextVideo() {
    return state.videoList[state.currentVideoIndex + 1];
  }

  // 跳转到上一个视频
  VideoInfo gotoPrevVideo(){
    state = ShortVideoList(
      videoList: state.videoList,
      currentVideoIndex: state.currentVideoIndex - 1,
    );
    return state.videoList[state.currentVideoIndex];
  }

  // 跳转到下一个视频
  VideoInfo gotoNextVideo(){
    // 更新当前视频索引
    state = ShortVideoList(
      videoList: state.videoList,
      currentVideoIndex: state.currentVideoIndex + 1,
    );
    return state.videoList[state.currentVideoIndex];
  }

  // 跳转到指定视频
  Future<VideoInfo?> gotoVideoAt(int index) async {
    if(index >= state.videoList.length){
      return null;
    }
    // 获取当前视频索引
    state = ShortVideoList(
      videoList: state.videoList,
      currentVideoIndex: index,
    );
    return state.videoList[state.currentVideoIndex];
  }

}