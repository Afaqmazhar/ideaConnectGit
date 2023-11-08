
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ideafront/Admin/views/home/zoom_drawer_screen.dart';
import 'package:ideafront/auth/login.dart';
import 'package:ideafront/session/session.dart';
import '../../IdeaMaker/views/home_screen/home.dart';
import '../home_screen/homeScreen.dart';

// Splash Screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // now we have to create a method to change screen
  changeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      // first create instance
      final _auth = FirebaseAuth.instance;
      // now we take auth reference
      final user = _auth.currentUser;

      if (user != null) {
        var firebaseFirestore = FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get()
            .then((DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists) {
            if (documentSnapshot.get('role') == "IdeaMaker") {
              SessionController().userid = user.uid.toString();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeIdea(),
                ),
              );
            } else if (documentSnapshot.get('role') == "admin") {
              SessionController().userid = user.uid.toString();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePageAdmins(),
                ),
              );
            } else if (documentSnapshot.get('role') == "Investor") {
              SessionController().userid = user.uid.toString();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreenInvestor(),
                ),
              );
            }
          } else {
            // If the document does not exist, navigate to the LoginPage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            );
          }
        });
      } else {
        // If the user is null, navigate to the LoginPage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    changeScreen();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF092C33),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 280,
            ),
            Center(
              child: Image.asset('assets/images/logoIdea.png'),
            ),
            RichText(
              text: const TextSpan(
                text: '  Ide',
                style: TextStyle(
                  color: Color(0xFF10E0AE),
                  fontSize: 36,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'aConn',
                    style: TextStyle(
                      color: Color(0xFF10E0AE),
                      fontSize: 36,
                    ),
                  ),
                  TextSpan(
                    text: 'ect',
                    style: TextStyle(
                      fontSize: 36,
                      color: Color(0xFF10E0AE),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
