import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideafront/Investor/subscriptionscreen/selectcardScreen/amx.dart';
import 'package:ideafront/Investor/subscriptionscreen/selectcardScreen/mastercard.dart';
import 'package:ideafront/Investor/subscriptionscreen/selectcardScreen/paypal.dart';
import 'package:ideafront/Investor/subscriptionscreen/selectcardScreen/visa.dart';
class ChoosePayment extends StatelessWidget {
  const ChoosePayment({super.key});

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
                IconButton(onPressed: (){Get.back();}, icon: const Icon(Icons.arrow_back,color: Colors.white,size: 40,)),
                const SizedBox(width: 50,),
                const Text('Select payment Methods',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
              ],
            ),
            const SizedBox(
              height: 170,
            ),
        GestureDetector(
          onTap: () {
            Get.to(() => const MasterCard());
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF21A690),
              borderRadius: BorderRadius.circular(12.0),
            ),
            width: 375.0,
            height: 88.0,
            child: Row(
              children: [
                const SizedBox(width: 20),
                Image.asset(
                  'assets/icons/mastercard.png',
                  width: 48.0,
                  height: 48.0,
                ),
                const SizedBox(width: 8.0),
                const Text(
                  'MasterCard',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                // Handle tap gesture
                Get.to(() => const VisaCard());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF21A690),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                width: 375.0,
                height: 88.0,
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    Image.asset(
                      'assets/icons/visa.png',
                      width: 48.0,
                      height: 48.0,
                    ),
                    const SizedBox(width: 8.0),
                    const Text(
                      'Visa',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                // Handle tap gesture
                Get.to(() => const Amx());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF21A690),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                width: 375.0,
                height: 88.0,
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    Image.asset(
                      'assets/icons/amx.png',
                      width: 48.0,
                      height: 48.0,
                    ),
                    const SizedBox(width: 8.0),
                    const Text(
                      'American Express',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                // Handle tap gesture
                Get.to(() => const Paypal());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF21A690),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                width: 375.0,
                height: 88.0,
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    Image.asset(
                      'assets/icons/paypal.png',
                      width: 48.0,
                      height: 48.0,
                    ),
                    const SizedBox(width: 8.0),
                    const Text(
                      'PayPal',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
