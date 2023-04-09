import 'package:followers_reports_analyzer/followers/models/user_model.dart';
import 'package:followers_reports_analyzer/followers/repository/followers_repository.dart';
import 'package:followers_reports_analyzer/utils/models/ig_headers.dart';
import 'package:mobx/mobx.dart';
part 'followers_store.g.dart';

class FollowersStore = FollowersStoreBase with _$FollowersStore;

abstract class FollowersStoreBase with Store {
  final FollowersRepository _repository = FollowersRepository();
  @observable
  bool loading = true;

  @observable
  String picProfile = '';

  @observable
  String username = '';

  @observable
  bool followersLoading = false;

  @observable
  bool followingLoading = false;

  ObservableList<UserModel> followersUsersList = ObservableList();

  ObservableList<UserModel> followingUsersList = ObservableList();

  ObservableList<UserModel> notFollowingMeList = ObservableList();

  ObservableList<UserModel> newFollowersList = ObservableList();

  @action
  getProfile(String queryHash, String userId, IgHeaders headers,
      FollowersStore store) async {
    await _repository.getProfile(queryHash, userId, headers).then((profile) {
      picProfile = profile.userImgUrl;
      username = profile.userUsername;
      loading = false;
    });
    await _repository.getFollowersList(userId, headers, null, store);
    await _repository.getFollowingList(userId, headers, null, store);
  }

  @action
  checkNotFollowing() {
    notFollowingMeList = ObservableList();
    if (followersLoading == true && followingLoading == true) {
      for (var following in followingUsersList) {
        bool test = false;
        for (var element in followersUsersList) {
          if (element.username == following.username) {
            test = true;
          }
        }
        if (!test) {
          notFollowingMeList.add(following);
        }
      }
      for (var element in followersUsersList) {
        print(element.pkId);
      }
    }
  }
}
