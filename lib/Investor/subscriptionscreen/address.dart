import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideafront/commonwidgets/cardwidgetflag.dart';

import '../../commonwidgets/cardwidget.dart';
import 'addaddress.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF092C33),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){Get.back();}, icon: const Icon(Icons.arrow_back,color: Colors.white,size: 40,)),
                const Text('Address Book',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
                IconButton(onPressed: (){Get.to(() => const AddressAdd());},
                    icon: const Icon(Icons.add,color: Colors.white,size: 40,)),
              ],
            ),
            const SizedBox(
              height:40,
            ),
            CustomCard(),
            const SizedBox(
              height:30,
            ),
            CustomCardflag(),
            const SizedBox(
              height:30,
            ),
            CustomCardflag(),
            const SizedBox(
              height:30,
            ),
            CustomCardflag(),          const SizedBox(
              height:30,
            ),
            CustomCardflag(),          const SizedBox(
              height:30,
            ),
            CustomCardflag(),
          ],
        ),
      ),
    );
  }
}
