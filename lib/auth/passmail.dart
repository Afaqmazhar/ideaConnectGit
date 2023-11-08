import 'package:ideafront/auth/login.dart';

import '../IdeaMaker/consts/consts.dart';

class passmail extends StatelessWidget {
  const passmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF092C33),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 180,
              ),
              Center(
                child: Image.asset('assets/images/arrow iage.png'),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text('Password Reset e-mail',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
              const Text('has been sent ',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
              const SizedBox(
                height: 30,
              ),
              const Text('A password reset e-mail has been',style: TextStyle(color: Colors.white,fontSize: 20),),
              const Text('sent to your email address',style: TextStyle(color: Colors.white,fontSize: 20),),

              const SizedBox(
                height: 40,
              ),

              const SizedBox(
                height: 130,
              ),
              "Check your mail"
                  .text
                  .white
                  .xl2
                  .make().centered()
                  .box
                  .rounded
                  .p8
                  .color(greenColor)
                  .width(360)
                  .height(50)
                  .make()
                  .onTap(() {
                Get.to(() => const LoginPage());
              }),
            ],
          ),
        ),
      ),
    );
  }
}
