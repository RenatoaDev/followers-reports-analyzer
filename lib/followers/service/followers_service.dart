import 'dart:convert';
import 'package:followers_reports_analyzer/followers/models/followers_data_model.dart';
import 'package:followers_reports_analyzer/followers/models/profile_model.dart';
import 'package:followers_reports_analyzer/utils/models/ig_headers.dart';
import 'package:http/http.dart' as http;

class FollowersService {
  Future<ProfileModel> getProfile(
      String queryHash, String userId, IgHeaders headers) async {
    var client = http.Client();
    var response = await client.get(
        Uri.parse(
            'https://www.instagram.com/graphql/query/?query_hash=$queryHash&variables=%7B%22user_id%22%3A%22$userId%22%2C%22include_chaining%22%3Afalse%2C%22include_reel%22%3Atrue%2C%22include_suggested_users%22%3Atrue%2C%22include_logged_out_extras%22%3Afalse%2C%22include_highlight_reels%22%3Afalse%2C%22include_live_status%22%3Afalse%7D'),
        headers: headers.toJson().cast());
    String html = jsonDecode(response.body).toString();

    RegExp picProfile = RegExp("profile_pic_url:([^}]+),");
    RegExp usernameProfile = RegExp("username:([^}]+)}");
    String pic =
        picProfile.firstMatch(html.replaceAll(' ', ''))?[1].toString() ?? '';
    String username =
        usernameProfile.firstMatch(html.replaceAll(' ', ''))?[1].toString() ??
            '';

    return ProfileModel(userImgUrl: pic, userUsername: username);
  }

  Future<FollowersDataModel> getFollowersList(
      String userId, IgHeaders headers, String? nextMaxId) async {
    String url =
        'https://i.instagram.com/api/v1/friendships/$userId/followers/?search_surface=follow_list_page&query=&enable_groups=true';
    if (nextMaxId != null) {
      url =
          'https://i.instagram.com/api/v1/friendships/$userId/followers/?search_surface=follow_list_page&max_id=$nextMaxId&query=&enable_groups=true';
    }
    var client = http.Client();
    var response = await client.get(
      Uri.parse(url),
      headers: headers.toJson().cast(),
    );
    return FollowersDataModel.fromJson(jsonDecode(response.body));
  }

  Future<FollowersDataModel> getFollowingList(
      String userId, IgHeaders headers, String? nextMaxId) async {
    String url =
        'https://i.instagram.com/api/v1/friendships/$userId/following/?includes_hashtags=true&search_surface=follow_list_page&query=&enable_groups=true';
    if (nextMaxId != null) {
      url =
          'https://i.instagram.com/api/v1/friendships/$userId/following/?search_surface=follow_list_page&max_id=$nextMaxId&query=&enable_groups=true';
    }
    var client = http.Client();
    var response = await client.get(
      Uri.parse(url),
      headers: headers.toJson().cast(),
    );
    return FollowersDataModel.fromJson(jsonDecode(response.body));
  }
}
