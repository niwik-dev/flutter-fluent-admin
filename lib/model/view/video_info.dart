class VideoInfo{
  String? videoId;        // 视频id
  String? videoUrl;       // 视频链接
  String? authorThumbUrl; // 创作者头像
  String? authorNickName; // 创建作者昵称
  String? caption;        // 视频标题
  String? description;    // 视频描述
  int? commentCount;      // 评论数
  int? diggCount;         // 点赞数
  int? shareCount;        // 分享数
  int? collectCount;      // 收藏数
  int? playCount;         // 播放数
  int? createTime;        // 创建时间

  VideoInfo({
    required this.videoId,
    required this.videoUrl,
    required this.authorThumbUrl,
    required this.authorNickName,
    required this.caption,
    required this.description,
    required this.commentCount,
    required this.diggCount,
    required this.shareCount,
    required this.collectCount,
    required this.playCount,
    required this.createTime,
  });

  @override
  String toString(){
    return 'VideoInfo(videoUrl: $videoUrl, authorThumbUrl: $authorThumbUrl)';
  }
}