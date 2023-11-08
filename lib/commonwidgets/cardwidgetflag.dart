import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideafront/Investor/subscriptionscreen/paymentmethod.dart';

class CustomCardflag extends StatefulWidget {
  @override
  _CustomCardflagState createState() => _CustomCardflagState();
}

class _CustomCardflagState extends State<CustomCardflag> {
  bool isPaymentMethodSelected = false;

  void togglePaymentMethod() {
    setState(() {
      isPaymentMethodSelected = !isPaymentMethodSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){Get.to(() => const PaymentForward());
      },
      child: Card(
        color: const Color(0xFF21A690),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: 325,
          height: 160,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF21A690),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // Offset of the shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Afaq Mazhar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF21A690),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.flag_outlined,
                              color: Colors.white,
                              size: 16,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Default',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                height: 1,
                color: Colors.white,
              ),
              const SizedBox(height: 14),
              const Text(
                'G1 Near Doctor hospital Johar Town,Lahore',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  GestureDetector(
                    onTap: togglePaymentMethod,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: isPaymentMethodSelected ? Colors.purpleAccent : Colors.white,
                          width: 2,
                        ),
                      ),
                      child: isPaymentMethodSelected
                          ? const Icon(
                        Icons.check,
                        size: 16,
                        color: Colors.purpleAccent,
                      )
                          : null,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Use as a payment method',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
