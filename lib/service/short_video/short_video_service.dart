import 'package:flutter_admin/api/restful/tikhub_api.dart';

import '../../model/view/comment_info.dart';
import '../../model/view/video_info.dart';

class ShortVideoService{
  // 单例模式
  static final ShortVideoService _instance = ShortVideoService._internal();
  factory ShortVideoService() => _instance;
  ShortVideoService._internal();

  final DouYinWebApi douYinWebApi = DouYinWebApi();

  Future<List<VideoInfo>> getDouYinVideo() async {
    final fetchHomeFeed = await douYinWebApi.fecthHomeFeed(count: 1, freshIndex: 1);
    List<VideoInfo> videoList = [];
    fetchHomeFeed.awemeList?.forEach((item){
      final videoId = item.awemeId;
      final videoUrl = item.video?.bitRate?.first.playAddr?.urlList?.last;
      final authorThumbUrl = item.author?.avatarThumb?.urlList?.first;
      final authorNickName = item.author?.nickname;
      final caption = item.caption;
      final description = item.desc;
      final commentCount = item.statistics?.commentCount;
      final diggCount = item.statistics?.diggCount;
      final shareCount = item.statistics?.shareCount;
      final collectCount = item.statistics?.collectCount;
      final playCount = item.statistics?.playCount;
      final createdTime = item.createTime;

      videoList.add(
        VideoInfo(
          videoId: videoId,
          videoUrl: videoUrl,
          authorThumbUrl: authorThumbUrl,
          authorNickName: authorNickName,
          caption: caption,
          description: description,
          commentCount: commentCount,
          diggCount: diggCount,
          shareCount: shareCount,
          collectCount: collectCount,
          playCount: playCount,
          createTime: createdTime,
        )
      );
    });
    return videoList;
  }

  Future<List<CommentInfo>> getDouYinVideoComments({
    required String videoId,
    int count = 10,
    int cursor = 0,
  }) async {
    final fetchVideoComments = await douYinWebApi.fetchVideoComments(
      awemeId: videoId,
      count: count,
      cursor: cursor,
    );
    List<CommentInfo> commentsList = [];
    fetchVideoComments.comments?.forEach((comment){
      commentsList.add(
        CommentInfo(
          commentId: comment.cid,
          commentText: comment.text,
          userId: comment.user?.uid,
          userName: comment.user?.nickname,
          userAvatar: comment.user?.avatarThumb?.urlList?.last,
          createTime: comment.createTime,
          diggCount: comment.diggCount,
          isAuthorDigged: comment.isAuthorDigged,
          ipLabel: comment.ipLabel,
        )
      );
    });
    return commentsList;
  }
}