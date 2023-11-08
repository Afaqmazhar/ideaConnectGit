import 'package:flutter/material.dart';

import '../home/menu_widget.dart';

class SubscriptionStats extends StatelessWidget {
  const SubscriptionStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('Subscription Stats'),
        leading: MenuWidget(),
      ),
    );
  }
}
