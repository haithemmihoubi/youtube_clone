import 'package:get/get.dart';
import 'package:youtube_clone/app/model/default.dart';
import 'package:youtube_clone/app/model/statistics.dart';

class YoutubeRepository extends GetConnect {

  @override
  void onInit() {
    httpClient.baseUrl = "https://www.googleapis.com";
  }




  Future<YoutubeVideoResult?> loadVideos(String nextPageToken) async {
    String url =
        "/youtube/v3/search?part=snippet&channelId=UCytEtngcIINSMbdc22SrbrQ&maxResults=10000&order=date&type=video&videoDefinition=high&key=AIzaSyAR2jiNyvTrRRpaYp5KhSZO0RuXmzMzB9c&pageToken=$nextPageToken";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
  }

  Future<YoutubeVideoResult?> loadGetxVed(String nextPageToken) async {
    String url =
        "/youtube/v3/search?part=snippet&channelId=UCytEtngcIINSMbdc22SrbrQ&maxResults=10000&q=getx&order=date&type=video&videoDefinition=high&key=AIzaSyAR2jiNyvTrRRpaYp5KhSZO0RuXmzMzB9c&pageToken=$nextPageToken";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
  }

  Future<YoutubeVideoResult?> loadCleanCode(String nextPageToken) async {
    String url =
        "/youtube/v3/search?part=snippet&channelId=UCytEtngcIINSMbdc22SrbrQ&maxResults=10000&q=cleancode&order=date&type=video&videoDefinition=high&key=AIzaSyAR2jiNyvTrRRpaYp5KhSZO0RuXmzMzB9c&pageToken=$nextPageToken";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
  }
  Future<YoutubeVideoResult?> loadDart(String nextPageToken) async {
    String url =
        "/youtube/v3/search?part=snippet&channelId=UCytEtngcIINSMbdc22SrbrQ&maxResults=10000&q=dart&order=date&type=video&videoDefinition=high&key=AIzaSyAR2jiNyvTrRRpaYp5KhSZO0RuXmzMzB9c";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
  }

  Future<YoutubeVideoResult?> search(String searchKeyword, String nextPageToken) async {
    String url =
        "/youtube/v3/search?part=snippet&maxResults=10000&order=date&type=video&videoDefinition=high&key=AIzaSyAR2jiNyvTrRRpaYp5KhSZO0RuXmzMzB9c&pageToken=$nextPageToken&q=$searchKeyword";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
  }

Future<Statistics?> getVideoInfoById(String videoId, String nextPageToken) async {
    //urls must be changed
    String url =
        "/youtube/v3/search?part=statistics&id=$videoId"
        "&key=AIzaSyAR2jiNyvTrRRpaYp5KhSZO0RuXmzMzB9c";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return Statistics.fromJson(response.body['statistics']);
      }
    }
  }



}