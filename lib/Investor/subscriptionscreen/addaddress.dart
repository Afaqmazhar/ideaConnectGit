import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideafront/Investor/subscriptionscreen/paymentmethod.dart';
import 'package:velocity_x/velocity_x.dart';

class AddressAdd extends StatefulWidget {
  const AddressAdd({super.key});

  @override
  State<AddressAdd> createState() => _AddressAddState();
}

class _AddressAddState extends State<AddressAdd> {
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
              children: [
                IconButton(onPressed: (){Get.back();}, icon: const Icon(Icons.arrow_back,color: Colors.white,size: 40,)),
                const SizedBox(width: 25,),
                const Center(
                  child: Column(
                    children: [
                      SizedBox(height: 25,),
                      Text('Add new Payment',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                      Text('address',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8, top: 8),
                  child: Text(
                    'Full Name', // Title text
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 360,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9), // Background color
                    borderRadius: BorderRadius.circular(10), // Border radius
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: TextField(
                      style: TextStyle(color: Colors.black,fontSize: 18), // Text color
                      decoration: InputDecoration(
                        border: InputBorder.none, // Remove default border
                        hintText: '', // Hint text
                        hintStyle: TextStyle(color: Colors.black), // Hint text color
                      ),
                    ),
                  ),
                ),
              ],
            ),
            10.heightBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8, top: 8),
                  child: Text(
                    'Street Address', // Title text
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 360,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9), // Background color
                    borderRadius: BorderRadius.circular(10), // Border radius
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: TextField(
                      style: TextStyle(color: Colors.black,fontSize: 18), // Text color
                      decoration: InputDecoration(
                        border: InputBorder.none, // Remove default border
                        hintText: '', // Hint text
                        hintStyle: TextStyle(color: Colors.black), // Hint text color
                      ),
                    ),
                  ),
                ),
              ],
            ),
            10.heightBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8, top: 8),
                  child: Text(
                    'State', // Title text
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 360,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9), // Background color
                    borderRadius: BorderRadius.circular(10), // Border radius
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: TextField(
                      style: TextStyle(color: Colors.black,fontSize: 18), // Text color
                      decoration: InputDecoration(
                        border: InputBorder.none, // Remove default border
                        hintText: '', // Hint text
                        hintStyle: TextStyle(color: Colors.black), // Hint text color
                      ),
                    ),
                  ),
                ),
              ],
            ),
            10.heightBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8, top: 8),
                  child: Text(
                    'City', // Title text
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 360,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9), // Background color
                    borderRadius: BorderRadius.circular(10), // Border radius
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: TextField(
                      style: TextStyle(color: Colors.black,fontSize: 18), // Text color
                      decoration: InputDecoration(
                        border: InputBorder.none, // Remove default border
                        hintText: '', // Hint text
                        hintStyle: TextStyle(color: Colors.black), // Hint text color
                      ),
                    ),
                  ),
                ),
              ],
            ),
            10.heightBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8, top: 8),
                  child: Text(
                    'Postal Code', // Title text
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 360,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9), // Background color
                    borderRadius: BorderRadius.circular(10), // Border radius
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: TextField(
                      style: TextStyle(color: Colors.black,fontSize: 18), // Text color
                      decoration: InputDecoration(
                        border: InputBorder.none, // Remove default border
                        hintText: '', // Hint text
                        hintStyle: TextStyle(color: Colors.black), // Hint text color
                      ),
                    ),
                  ),
                ),
              ],
            ),
            40.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Action to perform when the button is pressed
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD9D9D9), // Set the button color to D9D9D9
                    minimumSize: const Size(150, 50), // Set the button size
                  ),
                  child: const Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
                20.widthBox,
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => const PaymentForward());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF92B13A), // Set the button color to D9D9D9
                    minimumSize: const Size(150, 50), // Set the button size
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
