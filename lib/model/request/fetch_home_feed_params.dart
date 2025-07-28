class FetchHomeFeedParams{
  int count = 0;
  int freshIndex = 10;

  FetchHomeFeedParams({
    this.count = 0,
    this.freshIndex = 10,
  });

  Map<String, dynamic> toJson() {
    return {
      "count": count,
      "fresh_index": freshIndex,
    };
  }
}