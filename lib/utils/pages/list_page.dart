import 'package:flutter/material.dart';
import 'package:followers_reports_analyzer/followers/models/user_model.dart';

class ListPage extends StatelessWidget {
  final String title;
  final List<UserModel> userModelList;
  const ListPage({
    Key? key,
    required this.title,
    required this.userModelList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffcdb2),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffffb4a2),
        title: Text(title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 2),
            child: Center(
                child: Text(
              userModelList.length.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            )),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: userModelList.length,
          itemBuilder: ((context, index) {
            String name = userModelList[index].fullName;
            if (userModelList[index].fullName.isEmpty) {
              name = userModelList[index].username;
            }

            return ListTile(
              title: Text(name),
              leading: CircleAvatar(
                radius: 22,
                child: ClipOval(
                  child: Image.network(
                    userModelList[index].profilePicUrl,
                  ),
                ),
              ),
            );
          })),
    );
  }
}
