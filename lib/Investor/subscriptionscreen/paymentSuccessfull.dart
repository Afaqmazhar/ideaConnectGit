import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideafront/IdeaMaker/views/home_screen/home.dart';


class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF092C33),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 130,
              ),
              const Text(
                'Success!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'Your Idea is Monitized',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 130,
              ),
              Center(
                child: Image.asset('assets/images/okypass.png'),
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 130,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const HomeIdea());
                },
                child: Stack(
                  children: [
                    Container(
                      width: 360,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xff2FDBBC),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black),
                      ),
                      child: const Center(
                        child: Text(
                          'Continue To Home Screen',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      right: 8,
                      top: 0,
                      bottom: 0,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
