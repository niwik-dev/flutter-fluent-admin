class VideoInfo{
  String? videoId;
  String? videoUrl;
  String? authorThumbUrl;
  String? authorNickName;
  String? caption;
  String? description;
  int? commentCount;
  int? diggCount;
  int? shareCount;
  int? collectCount;
  int? playCount;
  int? createTime;

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