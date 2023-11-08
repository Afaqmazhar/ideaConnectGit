import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideafront/Investor/subscriptionscreen/selectcardScreen/amx.dart';
import 'package:ideafront/Investor/subscriptionscreen/selectcardScreen/visa.dart';
import 'package:velocity_x/velocity_x.dart';

import '../chosepayment.dart';
import 'mastercard.dart';

class Paypal extends StatelessWidget {
  const Paypal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF092C33),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.to(() => const ChoosePayment());
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 40,
                    )),
                const SizedBox(
                  width: 50,
                ),
                const Text(
                  'Add payment Methods',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      'Enter your payment details',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      'By Continue you agree to our ',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      'Terms',
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const VisaCard());
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(25)),
                    width: 48.0,
                    height: 48.0,
                    child: Image.asset('assets/icons/visa.png'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle tap gesture for the second image
                    Get.to(() => const MasterCard());
                  },
                  child: SizedBox(
                    width: 48.0,
                    height: 48.0,
                    child: Image.asset('assets/icons/mastercard.png'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const Amx());
                  },
                  child: SizedBox(
                    width: 48.0,
                    height: 48.0,
                    child: Image.asset('assets/icons/amx.png'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle tap gesture for the fourth image
                  },
                  child: SizedBox(
                    width: 90.0,
                    height: 90.0,
                    child: Image.asset('assets/icons/paypaltick.png'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: 325.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
                onChanged: (value) {
                  // Handle text changes
                },
                decoration: const InputDecoration(
                  hintText: 'Name on Card',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16.0),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 325.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
                onChanged: (value) {
                  // Handle text changes
                },
                decoration: const InputDecoration(
                  hintText: 'Card Number',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16.0),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 155.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextField(
                    onChanged: (value) {
                      // Handle text changes
                    },
                    decoration: const InputDecoration(
                      hintText: 'Month',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 155.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextField(
                    onChanged: (value) {
                      // Handle text changes
                    },
                    decoration: const InputDecoration(
                      hintText: 'Year',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 155.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextField(
                    onChanged: (value) {
                      // Handle text changes
                    },
                    decoration: const InputDecoration(
                      hintText: 'CVC',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 155.0,
                  height: 50.0,
                  color: Colors.transparent,
                  child: const Center(
                    child: Text(
                      '3 or 4 digits usually found\non the signature strip',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 120,
            ),
            "Save"
                .text
                .white
                .xl2
                .make()
                .centered()
                .box
                .rounded
                .p8
                .color(const Color(0xff2FDBBC))
                .width(360)
                .height(50)
                .make()
                .onTap(() {
              Get.to(() => {});
            }),
          ],
        ),
      ),
    );
  }
}
