class UserModel {
  String? pkId;
  late String username;
  late String fullName;
  bool? isPrivate;
  bool? isVerified;
  String? profilePicId;
  late String profilePicUrl;

  UserModel(
      {this.pkId,
      required this.username,
      required this.fullName,
      this.isPrivate,
      this.isVerified,
      this.profilePicId,
      required this.profilePicUrl});

  UserModel.fromJson(Map<String, dynamic> json) {
    pkId = json['pk_id'];
    username = json['username'];
    fullName = json['full_name'];
    isPrivate = json['is_private'];
    isVerified = json['is_verified'];
    profilePicId = json['profile_pic_id'];
    profilePicUrl = json['profile_pic_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pk_id'] = pkId;
    data['username'] = username;
    data['full_name'] = fullName;
    data['is_private'] = isPrivate;
    data['is_verified'] = isVerified;
    data['profile_pic_id'] = profilePicId;
    data['profile_pic_url'] = profilePicUrl;
    return data;
  }
}
