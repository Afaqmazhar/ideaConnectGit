import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:ideafront/Admin/views/chat_screen/chat_screen.dart';
import 'package:ideafront/Admin/views/home/menu_page.dart';
import 'package:ideafront/Admin/views/home/HomePage.dart';
import 'package:ideafront/Admin/views/reported_issues/reported_issues.dart';
import 'package:ideafront/Admin/views/subscription_stats/subscription_stats.dart';
import 'package:ideafront/Admin/views/user_management/user_management.dart';

import '../../../IdeaMaker/consts/consts.dart';
import '../../../const/lists.dart';
import '../idea_detail/idea_detail.dart';
import '../profile/admin_profile.dart';

class HomePageAdmins extends StatefulWidget {
  const HomePageAdmins({Key? key}) : super(key: key);

  @override
  State<HomePageAdmins> createState() => _HomePageAdminsState();
}

class _HomePageAdminsState extends State<HomePageAdmins> {
  MenuItem currentItem = MenuItems.dashBoard;
  @override
  Widget build(BuildContext context) => ZoomDrawer(
        style: DrawerStyle.defaultStyle,
        borderRadius: 40,
        angle: -10,
        showShadow: true,
        slideWidth: MediaQuery.of(context).size.width * 0.8,
        menuBackgroundColor: greenColor,
        menuScreen: Builder(builder: (context) {
          return MenuPage(
              currentItem: currentItem,
              onSelectedItem: (item) {
                setState(() {
                  currentItem = item;
                });
                ZoomDrawer.of(context)!.close();
              });
        }),
        mainScreen: getScreen(),
      );

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.userManagement:
        return UserManagement();
      case MenuItems.ideas:
        return const IdeaDetailAdmin();
      case MenuItems.subscription:
        return const SubscriptionStats();
      case MenuItems.reported:
        return const ReportedIssues();
      case MenuItems.chat:
        return const ChatAdmin();
      case MenuItems.profile:
        return const ProfileScreen();
      default:
        return const HomeAdmin();
    }
  }
}
