// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:followers_reports_analyzer/followers/followers_store.dart';
import 'package:followers_reports_analyzer/followers/models/user_model.dart';
import 'package:followers_reports_analyzer/utils/models/ig_headers.dart';
import 'package:followers_reports_analyzer/utils/pages/list_page.dart';

class FollowersView extends StatefulWidget {
  final IgHeaders igHeaders;
  final String queryHash;
  final String userId;
  const FollowersView(
      {Key? key,
      required this.igHeaders,
      required this.queryHash,
      required this.userId})
      : super(key: key);

  @override
  State<FollowersView> createState() => _FollowersViewState();
}

FollowersStore store = FollowersStore();

class _FollowersViewState extends State<FollowersView> {
  @override
  void initState() {
    store.getProfile(widget.queryHash, widget.userId, widget.igHeaders, store);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    listPage(String title, List<UserModel> userModelList) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ListPage(title: title, userModelList: userModelList)),
      );
    }

    return Observer(
      builder: (context) {
        return store.loading
            ? Scaffold(
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: CircularProgressIndicator()),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Carregando dados, aguarde...'),
                  ],
                ),
              )
            : Scaffold(
                backgroundColor: const Color(0xffffcdb2),
                appBar: AppBar(
                  backgroundColor: const Color(0xffffb4a2),
                  elevation: 0,
                  centerTitle: false,
                  title: Row(
                    children: [
                      Image.asset(
                        'assets/ig_logo.png',
                        height: 40,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        store.username,
                      ),
                    ],
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: CircleAvatar(
                        radius: 18,
                        child: ClipOval(
                          child: Image.network(
                            store.picProfile,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => listPage(
                            'Não me segue de volta', store.notFollowingMeList),
                        child: Card(
                          color: Color.fromARGB(255, 125, 124, 126),
                          child: ListTile(
                            title: Text(
                              'Não me segue de volta',
                              style: TextStyle(color: Colors.white),
                            ),
                            trailing: Text(
                              '-${store.notFollowingMeList.length.toString()}',
                              style: TextStyle(color: Colors.redAccent),
                            ),
                            leading: Icon(
                              Icons.person_remove_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            listPage('Seguidores', store.followersUsersList),
                        child: Card(
                          child: ListTile(
                            title: Text('Meus seguidores'),
                            trailing: Text(
                                store.followersUsersList.length.toString()),
                            leading: Icon(Icons.list_alt_outlined),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            listPage('Seguindo', store.followingUsersList),
                        child: Card(
                          child: ListTile(
                            title: Text('Quem eu sigo'),
                            trailing: Text(
                                store.followingUsersList.length.toString()),
                            leading: Icon(Icons.list_alt_outlined),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  backgroundColor: Color(0xffffb4a2),
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Color.fromARGB(255, 125, 124, 126),
                  elevation: 0,
                  items: [
                    BottomNavigationBarItem(
                        icon: const Icon(
                          Icons.home,
                        ),
                        label: 'Início'),
                    BottomNavigationBarItem(
                        icon: const Icon(Icons.menu), label: 'Menu')
                  ],
                ),
              );
      },
    );
  }
}
