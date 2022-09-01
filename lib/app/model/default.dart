import 'dart:convert';

class Default {
  String url;

  int width;

  int height;

  Default({required this.url, required this.width, required this.height});

  Map<String, dynamic> toJson() {
    return {
      "url": this.url,
      "width": this.width,
      "height": this.height,
    };
  }

  factory Default.fromJson(Map<String, dynamic> json) {
    return Default(
      url: json["url"],
      width: int.parse(json["width"]),
      height: int.parse(json["height"]),
    );
  }
}

class Thumbnails {
  Default thumbnailsDefault;
  Default medium;
  Default high;

  Thumbnails(
      {required this.thumbnailsDefault,
      required this.medium,
      required this.high});

  Map<String, dynamic> toJson() {
    return {
      "thumbnailsDefault": thumbnailsDefault,
      "medium": medium,
      "high": high,
    };
  }

  factory Thumbnails.fromJson(Map<String, dynamic> json) {
    return Thumbnails(
      thumbnailsDefault: Default.fromJson(json["thumbnailsDefault"]),
      medium: Default.fromJson(json["medium"]),
      high: Default.fromJson(json["high"]),
    );
  }
//
//

}

class Snippet {
  late Thumbnails thumbnails;
  late DateTime publishedAt, publishTime;
  late String description, title, channelId, liveBroadcastContent, channelTitle;

  Snippet(
      {required this.thumbnails,
      required this.publishedAt,
      required this.publishTime,
      required this.description,
      required this.title,
      required this.channelId,
      required this.liveBroadcastContent,
      required this.channelTitle});

  Map<String, dynamic> toJson() {
    return {
      "thumbnails": this.thumbnails,
      "publishedAt": this.publishedAt.toIso8601String(),
      "publishTime": this.publishTime,
      "description": this.description,
      "title": this.title,
      "channelId": this.channelId,
      "liveBroadcastContent": this.liveBroadcastContent,
      "channelTitle": this.channelTitle,
    };
  }

  factory Snippet.fromJson(Map<String, dynamic> json) {
    return Snippet(
      thumbnails: Thumbnails.fromJson(json["thumbnails"]),
      publishedAt: DateTime.parse(json["publishedAt"]),
      publishTime: json["publishTime"],
      description: json["description"],
      title: json["title"],
      channelId: json["channelId"],
      liveBroadcastContent: json["liveBroadcastContent"],
      channelTitle: json["channelTitle"],
    );
  }
//

}

class Id {
  String playlistId;
  String kind;

  Id({required this.playlistId, required this.kind});

  Map<String, dynamic> toJson() {
    return {
      "playlistId": playlistId,
      "kind": kind,
    };
  }

  factory Id.fromJson(Map<String, dynamic> json) {
    return Id(
      playlistId: json["playlistId"],
      kind: json["kind"],
    );
  }
//

}

class Video {
  Id id;
  Snippet snippet;
  String kind;
  String etag;

  Video(
      {required this.id,
      required this.snippet,
      required this.kind,
      required this.etag});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: Id.fromJson(json["id"]),
      snippet: Snippet.fromJson(json["snippet"]),
      kind: json["kind"],
      etag: json["etag"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "snippet": this.snippet,
      "kind": this.kind,
      "etag": this.etag,
    };
  }
//

}

class YoutubeVideoResult {
  int totalResults, resultsPerPage;
  String nextPageToken;
  List<Video> items;

  YoutubeVideoResult(
      {required this.totalResults,
      required this.resultsPerPage,
      required this.nextPageToken,
      required this.items});

  factory YoutubeVideoResult.fromJson(Map<String, dynamic> json) {
    return YoutubeVideoResult(
      totalResults: int.parse(json["totalResults"]),
      resultsPerPage: json["resultsPerPage"],
      nextPageToken: json["nextPageToken"],
      items: List.of(json["items"]).map((i) => i as Video).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "totalResults": this.totalResults,
      "resultsPerPage": this.resultsPerPage,
      "nextPageToken": this.nextPageToken,
      "items": jsonEncode(this.items),
    };
  }
//

}
