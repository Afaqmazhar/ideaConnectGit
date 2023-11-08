import 'dart:core';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:ideafront/auth/login.dart';
import 'package:ideafront/const/lists.dart';
import 'package:ideafront/session/session.dart';

import '../../../IdeaMaker/consts/consts.dart';

class MenuItems {
  static const dashBoard = MenuItem(
    'Dashboard',
    Icons.dashboard,
  );
  static const userManagement =
      MenuItem('All User', Icons.supervised_user_circle);
  static const ideas = MenuItem('Idea Detail', Icons.video_collection_sharp);
  static const subscription = MenuItem('Subscription Stats', Icons.query_stats);
  static const reported = MenuItem('Reported Issues', Icons.report_problem);
  static const chat = MenuItem('Chat', Icons.chat_bubble);
  static const profile = MenuItem('Profile', Icons.people);
  static const all = <MenuItem>[
    dashBoard,
    userManagement,
    ideas,
    subscription,
    reported,
    chat,
    profile
  ];
}

class MenuPage extends StatelessWidget {
  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;
  const MenuPage(
      {super.key, required this.currentItem, required this.onSelectedItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.heightBox,
            Row(
              children: [
                40.widthBox,
                const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      'assets/images/7.jpg',
                    )),
              ],
            ),
            5.heightBox,
            Column(
              children: [
                Row(
                  children: [
                    30.widthBox,
                    const Center(
                        child: Text(
                      'Afaq Mazhar',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    )),
                  ],
                )
              ],
            ),
            const Spacer(),
            ...MenuItems.all.map(buildMenuItem).toList(),
            const Spacer(
              flex: 2,
            ),
            OutlinedButton(
              onPressed: () {
                final _auth = FirebaseAuth.instance;
                _auth
                    .signOut()
                    .then((value) { SessionController().userid = '';
                Get.offAll(()=>const LoginPage());
                });
              },
              child: const Row(
                children: [
                  Spacer(
                    flex: 2,
                  ),
                  Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  Text(
                    'Logout',
                    style: TextStyle(color: Colors.white),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
            10.heightBox,
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(MenuItem item) => ListTile(
        selectedTileColor: Colors.black26,
        selected: currentItem == item,
        minLeadingWidth: 20,
        leading: Icon(
          item.icon,
          color: Colors.white,
        ),
        title: Text(
          item.title,
          style: const TextStyle(color: Colors.white),
        ),
        onTap: () {
          onSelectedItem(item);
        },
      );
}
