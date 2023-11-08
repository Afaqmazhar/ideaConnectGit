import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideafront/IdeaMaker/views/home_screen/home.dart';
import 'package:ideafront/Investor/subscriptionscreen/chosepayment.dart';

class PaymentFailed extends StatelessWidget {
  const PaymentFailed({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xFF092C33),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text('Failed!',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
              const Text('Your Subscription is failed',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
              const SizedBox(
                height: 120,
              ),
              Center(
                child: Image.asset('assets/icons/failedpayment.png'),
              ),
              const SizedBox(
                height: 130,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>const ChoosePayment());
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: const Color(0xff2FDBBC),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Positioned(
                            right: 8,
                            top: 0,
                            bottom: 0,
                            child: Icon(
                              Icons.refresh_outlined,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Try Again',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>const HomeIdea());
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Positioned(
                            right: 8,
                            top: 0,
                            bottom: 0,
                            child: Icon(
                              Icons.home,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
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

