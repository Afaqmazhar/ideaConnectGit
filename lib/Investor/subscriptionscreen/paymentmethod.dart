import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideafront/Investor/subscriptionscreen/chosepayment.dart';

class PaymentForward extends StatelessWidget {
  const PaymentForward({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF092C33),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Row(
                children: [
                  IconButton(onPressed: (){Get.back();}, icon: const Icon(Icons.arrow_back,color: Colors.white,size: 40,)),
                  const SizedBox(width: 70,),
                  const Text('Payment Methods',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                ],
              ),
              const SizedBox(
                height: 250,
              ),
              const Column(
                children: [
                  Text('No payment found',style: TextStyle(color: Colors.white,fontSize: 18),),
                  Text('You can add and edit payment during checkout',style: TextStyle(color: Colors.white,fontSize: 18),),
                ],
              ),
              const SizedBox(
                height: 200,
              ),
          SizedBox(
            height: 185,
            width: 325,
            child: Card(
              elevation: 10,
              shadowColor: Colors.pinkAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              color: const Color(0xFF21A690), // Set the card color to 21A690
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 IconButton(onPressed: (){Get.to(() => const ChoosePayment());
                 }, icon: const Icon(Icons.add_circle_outline_outlined,size: 48,color: Colors.white)),
                  const SizedBox(height: 8),
                  const Text(
                    'Add payment method',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFE4E4E4), // Set the text color to E4E4E4
                    ),
                  ),
                ],
              ),
            ),
          ),

          ],
          ),
        ),
      ),
    );
  }
}
