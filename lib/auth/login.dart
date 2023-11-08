import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideafront/Admin/views/home/zoom_drawer_screen.dart';
import 'package:ideafront/IdeaMaker/views/home_screen/home.dart';
import 'package:ideafront/Investor/home_screen/homeScreen.dart';
import 'package:ideafront/auth/forgotpass.dart';
import 'package:ideafront/auth/signup.dart';
import 'package:ideafront/utils/utils.dart';
import '../IdeaMaker/consts/consts.dart';
import '../IdeaMaker/consts/lists.dart';
import '../session/session.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool _isObscure3 = true;
  bool visible = false;
  bool _isLoading = false;

  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordNode = FocusNode();



  // ignore: unused_field
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: <Widget>[
        Column(
          children: [
            "Sign in to your\nAccount"
                .text
                .white
                .xl5
                .make()
                .centered()
                .box
                .p8
                .hexColor('#092C33')
                .width(context.screenWidth)
                .height(300)
                .make()
                .onTap(() {
              // Handle button press
            }),
            30.heightBox,
            Container(
              color: Colors.white,
              // width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              child: Center(
                child: Container(
                  margin: const EdgeInsets.all(12),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: emailController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(

                            hintStyle: const TextStyle(color: Colors.white),
                            labelStyle: const TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Colors.teal,
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
                          focusNode: emailFocusNode,
                          onFieldSubmitted: (value){
                            Utils.fieldFocus(context, emailFocusNode, passwordNode);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email cannot be empty";
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
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
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: _isObscure3,
                          style: const TextStyle(color: Colors.white),
                          focusNode: passwordNode,
                          decoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.white),
                            labelStyle: const TextStyle(color: Colors.white),
                            suffixIcon: IconButton(
                                color: Colors.white,
                                icon: Icon(_isObscure3
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure3 = !_isObscure3;
                                  });
                                }),
                            filled: true,
                            fillColor: Colors.teal,
                            hintText: 'Password',
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 15.0),
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
                            RegExp regex = RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            }
                            if (!regex.hasMatch(value)) {
                              return ("please enter valid password min. 6 character");
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            passwordController.text = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {
                                  Get.to(()=>const ForGotPass());
                                },
                                child: 'forgot password?'
                                    .text
                                    .color(Colors.blue)
                                    .make())),

                        const SizedBox(
                          height: 20,
                        ),
                        "Login"
                            .text
                            .white
                            .xl2
                            .make()
                            .centered()
                            .box
                            .rounded
                            .p8
                            .color(greenColor)
                            .width(380)
                            .height(50)
                            .make()
                            .onTap(() {
                          setState(() {
                            visible = true;
                          });
                          signIn(emailController.text, passwordController.text);
                        }),
                        if (_isLoading) const CircularProgressIndicator(),
                        30.heightBox,
                        'or login with'.text.size(16).bold.make(),
                        5.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            3,
                            (index) => Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 25,
                                child: Image.asset(
                                  socialIconList[index],
                                  // width: 30,
                                  // height: 40,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                        10.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account,',
                              style: TextStyle(fontFamily: 'Arial'),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.to(() => const RegisterIn());
                                },
                                child: 'Register'
                                    .text
                                    .color(Colors.blue)
                                    .size(16)
                                    .make()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    ));
  }

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    // ignore: unused_local_variable
    var firebaseFirestore = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('role') == "IdeaMaker") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeIdea(),
            ),
          );
        } else if (documentSnapshot.get('role') == "admin") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePageAdmins(),
            ),
          );
        } else if (documentSnapshot.get('role') == "Investor"){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreenInvestor(),
            ),
          );
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        _isLoading = true; // Show circular progress indicator
      });
      try {

        // ignore: unused_local_variable
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        String uid = userCredential.user!.uid;
        SessionController().userid = uid;
        route();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }finally {
        setState(() {
          _isLoading = false; // Hide circular progress indicator
        });
      }
    }
  }
}
