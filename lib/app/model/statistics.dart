class Statistics {
  String viewCount;
  String likeCount;
  String dislikeCount;
  String favoriteCount;
  String commentCount;

  Statistics(
      {required this.viewCount,
      required this.likeCount,
      required this.dislikeCount,
      required this.favoriteCount,
      required this.commentCount});

  factory Statistics.fromJson(Map<String, dynamic> json) {
    return Statistics(
      viewCount: json["viewCount"],
      likeCount: json["likeCount"],
      dislikeCount: json["dislikeCount"],
      favoriteCount: json["favoriteCount"],
      commentCount: json["commentCount"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "viewCount": this.viewCount,
      "likeCount": this.likeCount,
      "dislikeCount": this.dislikeCount,
      "favoriteCount": this.favoriteCount,
      "commentCount": this.commentCount,
    };
  }
//

}
