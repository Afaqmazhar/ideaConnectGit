import 'package:firebase_auth/firebase_auth.dart';
import 'package:ideafront/auth/passmail.dart';

import '../IdeaMaker/consts/consts.dart';

class ForGotPass extends StatefulWidget {
  const ForGotPass({super.key});

  @override
  State<ForGotPass> createState() => _ForGotPassState();
}

class _ForGotPassState extends State<ForGotPass> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          VxBox().height(100).hexColor('#092C33').width(430).make(),
          "Forgot Password"
              .text
              .white
              .xl5
              .make()
              .centered()
              .box
              .p8
              .hexColor('#092C33')
              .width(context.screenWidth)
              .height(200)
              .make()
              .onTap(() {
            // Handle button press
          }),
          45.heightBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              SizedBox(
                width: 360,
                height: 50,
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(color: Colors.white),
                    labelStyle: const TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.grey,
                    hintText: 'Email',
                    enabled: true,
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 8.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: greenColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(color: greenColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email cannot be empty";
                    }
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return ("Please enter a valid email");
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    emailController.text = value!;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ],
          ),
          20.heightBox,
          "Reset Password"
              .text
              .white
              .xl2
              .make()
              .centered()
              .box
              .rounded
              .p8
              .color(greenColor)
              .width(360)
              .height(50)
              .make()
              .onTap(() {
                if(emailController.text.isNotEmpty){
            setState(() {
              visible = true;
            });
            forgotPass(emailController.text);
            emailController.clear();
            Get.offAll(() => const passmail());}
          }),
        ],
      ),
    );
  }
}

void forgotPass(
  String email,
) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: email,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}
