import 'package:youtube_clone/app/model/default.dart';
import 'package:youtube_clone/app/model/statistics.dart';

class Youtuber {
  Statistics statistics;
  Snippet snippet;

  Youtuber({
    required this.statistics,
    required this.snippet,
  });

  factory Youtuber.fromJson(Map<String, dynamic> json) {
    return Youtuber(
      statistics: Statistics.fromJson(json["statistics"]),
      snippet: Snippet.fromJson(json["snippet"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "statistics": this.statistics,
      "snippet": this.snippet,
    };
  }
//

}
