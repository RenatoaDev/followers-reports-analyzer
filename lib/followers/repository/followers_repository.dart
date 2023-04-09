import 'package:followers_reports_analyzer/followers/followers_store.dart';
import 'package:followers_reports_analyzer/followers/models/profile_model.dart';
import 'package:followers_reports_analyzer/followers/service/followers_service.dart';
import 'package:followers_reports_analyzer/utils/models/ig_headers.dart';

class FollowersRepository {
  final FollowersService service = FollowersService();

  Future<ProfileModel> getProfile(
      String queryHash, String userId, IgHeaders headers) async {
    return await service.getProfile(queryHash, userId, headers);
  }

  getFollowersList(String userId, IgHeaders headers, String? nextMaxId,
      FollowersStore store) async {
    await service.getFollowersList(userId, headers, nextMaxId).then((data) {
      if (data.nextMaxId != null) {
        Future.delayed(const Duration(seconds: 2), () {
          store.followersUsersList.addAll(data.users!);
          getFollowersList(userId, headers, data.nextMaxId, store);
        });
      } else {
        store.followersUsersList.addAll(data.users!);
        store.followersLoading = true;
        store.checkNotFollowing();
      }
    });
  }

  getFollowingList(String userId, IgHeaders headers, String? nextMaxId,
      FollowersStore store) async {
    try {
      await service.getFollowingList(userId, headers, nextMaxId).then((data) {
        if (data.nextMaxId != null) {
          Future.delayed(const Duration(seconds: 2), () {
            store.followingUsersList.addAll(data.users!);
            getFollowingList(userId, headers, data.nextMaxId, store);
          });
        } else {
          store.followingUsersList.addAll(data.users!);
          store.followingLoading = true;
          store.checkNotFollowing();
        }
      });
    } catch (e) {}
  }
}
