import 'package:followers_reports_analyzer/followers/models/user_model.dart';

class FollowersDataModel {
  List<UserModel>? users;
  String? nextMaxId;
  bool? shouldLimitListOfFollowers;
  String? status;

  FollowersDataModel(
      {this.users,
      this.nextMaxId,
      this.shouldLimitListOfFollowers,
      this.status});

  FollowersDataModel.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = <UserModel>[];
      json['users'].forEach((v) {
        users!.add(UserModel.fromJson(v));
      });
    }
    nextMaxId = json['next_max_id'];
    shouldLimitListOfFollowers = json['should_limit_list_of_followers'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (users != null) {
      data['users'] = users!.map((v) => v.toJson()).toList();
    }
    data['next_max_id'] = nextMaxId;
    data['should_limit_list_of_followers'] = shouldLimitListOfFollowers;
    data['status'] = status;
    return data;
  }
}
