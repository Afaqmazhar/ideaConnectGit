import 'package:firebase_auth/firebase_auth.dart';
import 'package:ideafront/Admin/views/home/menu_widget.dart';
import 'package:ideafront/auth/login.dart';
import '../../../IdeaMaker/consts/consts.dart';
import '../../../session/session.dart';

class HomeAdmin extends StatelessWidget {
  const HomeAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    // if i wants to show the user id then i will first find it than show
    String? userId=Get.put(SessionController().userid);
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title:  SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const Text(
                'Hello, ',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                userId!,
                style: const TextStyle(
                    fontSize: 22, color: NewColor, fontWeight: FontWeight.bold),
              ),
              const Text(
                '!',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        leading:  MenuWidget(
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.pinkAccent.withOpacity(0.8),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(0, 3),
                    ),
                  ], color: NewColor, borderRadius: BorderRadius.circular(16)),
                  height: 150,
                  width: MediaQuery.of(context).size.width - 25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Total ',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            10.heightBox,
                            const Text(
                              'Ideas',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        '1044',
                        style: TextStyle(fontSize: 28, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            10.heightBox,
            Row(
              children: [
                10.widthBox,
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.pinkAccent.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    height: 150,
                    width: MediaQuery.of(context).size.width - 25,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Reported ',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                              10.heightBox,
                              const Text(
                                'Ideas',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          '30',
                          style: TextStyle(fontSize: 28, color: NewColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            10.heightBox,
            GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pinkAccent.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16)),
                height: 150,
                width: MediaQuery.of(context).size.width - 25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Number of  ',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          10.heightBox,
                          const Text(
                            'Investor',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      '244',
                      style: TextStyle(fontSize: 28, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            10.heightBox,
            Row(
              children: [
                10.widthBox,
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.pinkAccent.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: NewColor,
                        borderRadius: BorderRadius.circular(16)),
                    height: 150,
                    width: MediaQuery.of(context).size.width - 25,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Number of ',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              10.heightBox,
                              const Text(
                                'IdeaMakers',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          '350',
                          style: TextStyle(fontSize: 28, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            20.heightBox,
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width - 25,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pinkAccent.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(16)),
              child: GestureDetector(
                onTap: () {
                  final _auth = FirebaseAuth.instance;
                  _auth
                      .signOut()
                      .then((value) { SessionController().userid = '';
                  Get.offAll(()=>const LoginPage());
                  });                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'LOG',
                            style: TextStyle(
                                fontSize: 28,
                                color: NewColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'OUT',
                            style: TextStyle(
                                fontSize: 28,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.logout,
                        color: darkFontGrey,
                        size: 34,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
