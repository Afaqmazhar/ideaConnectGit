import 'package:flutter/material.dart';

import '../home/menu_widget.dart';

class ReportedIssues extends StatelessWidget {
  const ReportedIssues({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Reported Issues'),
        leading: MenuWidget(),
      ),
    );
  }
}
