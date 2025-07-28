import 'package:flutter_admin/service/short_video/douyin_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/view/video_info.dart';
import '../../store/short_video/short_video_store.dart';

class ShortVideoService{
  late var shortVideoStore;
  late ShortVideoStore shortVideoStoreNotifier;
  
  // 每次加载的短视频数量
  static const int videoCountPerLoading = 10;
  // 最少提前加载短视频数量
  static const int minVideoCountPreLoad = 1;

  DouYinWebService douYinWebService = DouYinWebService();

  bool isVideoLoadingFinished(){    
    return shortVideoStore.videoList.length > shortVideoStore.currentVideoIndex - minVideoCountPreLoad;
  }

  ShortVideoService(WidgetRef ref){
    shortVideoStore = ref.watch(shortVideoStoreProvider);
    shortVideoStoreNotifier = ref.watch(shortVideoStoreProvider.notifier);
  }
  
  Future<void> loadNewShortVideoList() async{ 
    if(shortVideoStore.videoList.length - shortVideoStore.currentVideoIndex >= minVideoCountPreLoad){
      return;
    }
    List<VideoInfo> totalVideoList = [];
    while(totalVideoList.length < videoCountPerLoading){
      final videoList = await douYinWebService.getDouYinVideo();
      totalVideoList.addAll(videoList);
    }
    shortVideoStoreNotifier.addNewVideos(totalVideoList);
  }

  VideoInfo getCurrentVideo(){
    return shortVideoStoreNotifier.getCurrentVideo();
  }

  Future<VideoInfo?> gotoNextVideo() async{
    loadNewShortVideoList().then(
      (value) {
        return shortVideoStoreNotifier.gotoNextVideo();
      }
    );
    return null;
  }
}