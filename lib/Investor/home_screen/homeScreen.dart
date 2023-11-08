import 'package:flutter/material.dart';
import 'package:ideafront/IdeaMaker/consts/colors.dart';
import 'package:ideafront/Investor/home_screen/homeescreens.dart';
import 'package:ideafront/Investor/profile/profile.dart';

import '../search_screen/SearchScreen.dart';
import '../notification_screen/notificationScreen.dart';

class HomeScreenInvestor extends StatefulWidget {
  const HomeScreenInvestor({Key? key}) : super(key: key);

  @override
  _HomeScreenInvestorState createState() => _HomeScreenInvestorState();
}

class _HomeScreenInvestorState extends State<HomeScreenInvestor>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onIconPressed(int index) {
    setState(() {
      if (_currentIndex != index) {
        _currentIndex = index;
      }
    });
    _animationController.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children:  [
          HomeScreens(),
          SearchScreen(),
          NotificationScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        height: 60.0,
        decoration: const BoxDecoration(
            // color: Color(0xFF092C33),
            color: greenColor,
            borderRadius: BorderRadius.all(Radius.circular(16))
            // borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildAnimatedIconButton(Icons.home, 0),
            _buildAnimatedIconButton(Icons.search, 1),
            _buildAnimatedIconButton(Icons.notifications, 2),
            _buildAnimatedIconButton(Icons.person, 3),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedIconButton(IconData icon, int index) {
    return GestureDetector(
      onTap: () => _onIconPressed(index),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: (_currentIndex == index) ? 40.0 : 30.0,
            height: (_currentIndex == index) ? 40.0 : 30.0,
            decoration: BoxDecoration(
              color:
                  (_currentIndex == index) ? Colors.white : Colors.transparent,
              borderRadius:
                  BorderRadius.circular((_currentIndex == index) ? 10.0 : 0.0),
            ),
            child: Icon(
              icon,
              color: (_currentIndex == index)
                  ? const Color(0xFF092C33)
                  : Colors.white,
            ),
          );
        },
      ),
    );
  }
}
