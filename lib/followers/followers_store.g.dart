// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'followers_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FollowersStore on FollowersStoreBase, Store {
  late final _$loadingAtom =
      Atom(name: 'FollowersStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$picProfileAtom =
      Atom(name: 'FollowersStoreBase.picProfile', context: context);

  @override
  String get picProfile {
    _$picProfileAtom.reportRead();
    return super.picProfile;
  }

  @override
  set picProfile(String value) {
    _$picProfileAtom.reportWrite(value, super.picProfile, () {
      super.picProfile = value;
    });
  }

  late final _$usernameAtom =
      Atom(name: 'FollowersStoreBase.username', context: context);

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$followersLoadingAtom =
      Atom(name: 'FollowersStoreBase.followersLoading', context: context);

  @override
  bool get followersLoading {
    _$followersLoadingAtom.reportRead();
    return super.followersLoading;
  }

  @override
  set followersLoading(bool value) {
    _$followersLoadingAtom.reportWrite(value, super.followersLoading, () {
      super.followersLoading = value;
    });
  }

  late final _$followingLoadingAtom =
      Atom(name: 'FollowersStoreBase.followingLoading', context: context);

  @override
  bool get followingLoading {
    _$followingLoadingAtom.reportRead();
    return super.followingLoading;
  }

  @override
  set followingLoading(bool value) {
    _$followingLoadingAtom.reportWrite(value, super.followingLoading, () {
      super.followingLoading = value;
    });
  }

  late final _$getProfileAsyncAction =
      AsyncAction('FollowersStoreBase.getProfile', context: context);

  @override
  Future getProfile(String queryHash, String userId, IgHeaders headers,
      FollowersStore store) {
    return _$getProfileAsyncAction
        .run(() => super.getProfile(queryHash, userId, headers, store));
  }

  late final _$FollowersStoreBaseActionController =
      ActionController(name: 'FollowersStoreBase', context: context);

  @override
  dynamic checkNotFollowing() {
    final _$actionInfo = _$FollowersStoreBaseActionController.startAction(
        name: 'FollowersStoreBase.checkNotFollowing');
    try {
      return super.checkNotFollowing();
    } finally {
      _$FollowersStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
picProfile: ${picProfile},
username: ${username},
followersLoading: ${followersLoading},
followingLoading: ${followingLoading}
    ''';
  }
}
