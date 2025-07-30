import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/view/video_info.dart';
import '../../store/short_video/short_video_store.dart';
import 'douyin_service.dart';

class ShortVideoService{
  late var shortVideoStore;
  late ShortVideoStore shortVideoStoreNotifier;
  
  // 每次加载的短视频数量
  static const int videoCountPerLoading = 8;
  // 最少提前加载短视频数量
  static const int minVideoCountPreLoad = 4;

  DouYinWebService douYinWebService = DouYinWebService();

  bool isNeedLoadNewVideo(){ 
    return shortVideoStore.videoList.length - shortVideoStore.currentVideoIndex < minVideoCountPreLoad;
  }

  ShortVideoService(WidgetRef ref){
    shortVideoStore = ref.watch(shortVideoStoreProvider);
    shortVideoStoreNotifier = ref.watch(shortVideoStoreProvider.notifier);
  }

  VideoInfo? getCurrentVideo(){
    return shortVideoStoreNotifier.getCurrentVideo();
  }

  VideoInfo getPrevVideo(){
    return shortVideoStoreNotifier.getPrevVideo();
  }

  VideoInfo getNextVideo(){
    return shortVideoStoreNotifier.getNextVideo();
  }
  
  Future<void> loadNewShortVideoList() async{ 
    List<VideoInfo> totalVideoList = [];
    while(totalVideoList.length < videoCountPerLoading){
      final videoList = await douYinWebService.getDouYinVideo();
      // 移除无视频链接的元素
      videoList.removeWhere((element) => element.videoUrl == null);
      totalVideoList.addAll(videoList);
    }
    shortVideoStoreNotifier.addNewVideos(totalVideoList);
  }

  Future<VideoInfo?> gotoVideoAt(int index) async{
    if(isNeedLoadNewVideo()){
      loadNewShortVideoList();
    }
    return shortVideoStoreNotifier.gotoVideoAt(index);
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