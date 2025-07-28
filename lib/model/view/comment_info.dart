class CommentInfo{
  final String? commentId;
  final String? userId;
  final String? userName;
  final String? userAvatar;
  final String? commentText;
  final int? createTime;
  final int? diggCount;
  final bool? isAuthorDigged;
  final String? ipLabel;

  CommentInfo({
    this.commentId,
    this.userId,
    this.userName,
    this.userAvatar,
    this.commentText,
    this.createTime,
    this.diggCount,
    this.isAuthorDigged,
    this.ipLabel,
  });
}