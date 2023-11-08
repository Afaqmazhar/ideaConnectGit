import '../../../Investor/notification_screen/notificationScreen.dart';
import '../../consts/consts.dart';
import '../../controllers/home_controller.dart';
import '../add_screen/add_screen.dart';
import '../profile_screen/profile_screen.dart';
import 'home_screen.dart';

class HomeIdea extends StatelessWidget {
  const HomeIdea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // to call our controller
    var controller = Get.put(HomeController());
    var navBarItem = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: home,
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.add_box),
        label: 'Add',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.notifications),
        label: 'Notification',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
    ];
    var navBody =  [
      const HomeScreen(),
      const AddScreen(),
      NotificationScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Center(child: Text(controller.currentNavIndex.value.toString(),style: TextStyle(color: Colors.white,fontSize: 22),)),
            Obx(() => Expanded(
                child: navBody.elementAt(controller.currentNavIndex.value))),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: greenColor,
          selectedLabelStyle: const TextStyle(fontFamily: semibold),
          backgroundColor: whiteColor,
          items: navBarItem,
          onTap: (value) {
            controller.currentNavIndex.value = value;
          },
        ),
      ),
    );
  }
}
