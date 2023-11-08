import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideafront/Investor/subscriptionscreen/address.dart';

class ChoosePlan extends StatelessWidget {
  const ChoosePlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF092C33),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            const Text('Choose a',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
            const Text('Subscription Plan',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40,bottom: 8),
              child: Align(
                alignment: Alignment.topLeft,
                  child: Text('Current Idea',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
            ),
            GestureDetector(
              onTap: (){
                Get.to(() => const AddressPage());
              },
              child: Container(
                width: 342,
                height: 197,
                decoration: BoxDecoration(
                  color: const Color(0xff2FDBBC), // Background color
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Text(

                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: '\$',
                            style: TextStyle(fontSize: 20), // Adjust the font size as desired
                          ),
                          TextSpan(
                            text: '10',
                            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold), // Adjust the font size and style as desired
                          ),
                          TextSpan(
                            text: '',
                            style: TextStyle(fontSize: 25), // Adjust the font size as desired
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10), // Adjust the spacing between the sections
                    const Text(
                      'Features',
                      style: TextStyle(
                        color: Colors.white, // Text color
                        fontSize: 22, // Increase the font size as desired
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '- Idea at top for 1 week\n'
                          '- Realize Revenue Opportunities\n'
                          '- Unlock Earning Possibilities',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white, // Text color
                        fontSize: 20, // Increase the font size as desired
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40,bottom: 8),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Five Ideas',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
            ),
            GestureDetector(
              onTap: (){
                Get.to(() => const AddressPage());
              },
              child: Container(
                width: 342,
                height: 204,
                decoration: BoxDecoration(
                  color: const Color(0xff2FDBBC), // Background color
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Text(

                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: '\$',
                            style: TextStyle(fontSize: 20), // Adjust the font size as desired
                          ),
                          TextSpan(
                            text: '40',
                            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold), // Adjust the font size and style as desired
                          ),
                          TextSpan(
                            text: '',
                            style: TextStyle(fontSize: 25), // Adjust the font size as desired
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10), // Adjust the spacing between the sections
                    const Text(
                      'Features',
                      style: TextStyle(
                        color: Colors.white, // Text color
                        fontSize: 22, // Increase the font size as desired
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '- Ideas at top for 1 week\n'
                          '- Realize Revenue Opportunities\n'
                          '- Unlock Earning Possibilities\n'
                          '- 20% Discount ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white, // Text color
                        fontSize: 20, // Increase the font size as desired
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
