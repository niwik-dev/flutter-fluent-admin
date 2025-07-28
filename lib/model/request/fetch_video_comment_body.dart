class FetchVideoCommentBody{
  String awemeId;
  int cursor;
  int count;

  FetchVideoCommentBody({
    required this.awemeId,
    this.cursor = 0,
    this.count = 20,
  });

  Map<String, dynamic> toJson() {
    return {
      "aweme_id": awemeId,
      "cursor": cursor,
      "count": count,
    };
  }
}