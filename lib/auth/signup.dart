import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../IdeaMaker/consts/consts.dart';
import '../utils/utils.dart';
import 'login.dart';
// import 'model.dart';

class RegisterIn extends StatefulWidget {
  const RegisterIn({super.key});

  @override
  RegisterInState createState() => RegisterInState();
}

class RegisterInState extends State<RegisterIn> {
  RegisterInState();

  bool showProgress = false;
  bool visible = false;
  bool _isLoading = false;


  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpassController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  bool _isObscure = true;
  bool _isObscure2 = true;
  File? file;
  var options = [
    'Investor',
    'IdeaMaker',
  ];
  var _currentItemSelected = "Investor";
  var role = "Investor";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            "Register"
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
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(12),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white),
                          labelStyle: const TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.teal,
                          hintText: 'Name',
                          enabled: true,
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: greenColor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(color: greenColor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Name cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {},
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: emailController,
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
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(color: greenColor),
                            borderRadius: BorderRadius.circular(20),
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
                        onChanged: (value) {},
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white),
                          labelStyle: const TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.teal,
                          hintText: 'Phone No.',
                          enabled: true,
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: greenColor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(color: greenColor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Phone number cannot be empty";
                          }
                          if (!RegExp(r'^\+923[0-9]{9}$').hasMatch(value)) {
                            return "Please enter a valid phone number starting with +923 and containing exactly 9 digits.";
                          }
                          // if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          //   return "Phone number must contain only digits (numbers).";
                          // }
                          return null;
                        },
                        onChanged: (value) {
                          // Handle onChanged if needed...
                        },
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: addressController,
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white),
                          labelStyle: const TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.teal,
                          hintText: 'Address',
                          enabled: true,
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 15.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: greenColor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(color: greenColor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Address cannot be empty";
                          }
                          // Additional custom validation logic for the address
                          // For example, you could check for specific patterns or minimum length.
                          // Modify this logic based on your address validation requirements.

                          // Example: Check if the address contains at least 5 characters.
                          if (value.trim().length < 5) {
                            return "Address should contain at least 5 characters.";
                          }

                          // If all validation conditions pass, return null (no error).
                          return null;
                        },
                        onChanged: (value) {
                          // Handle onChanged if needed...
                        },
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: _isObscure,
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white),
                          labelStyle: const TextStyle(color: Colors.white),
                          suffixIcon: IconButton(
                              color: Colors.black,
                              icon: Icon(_isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
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
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(color: greenColor),
                            borderRadius: BorderRadius.circular(20),
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
                        onChanged: (value) {},
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: _isObscure2,
                        controller: confirmpassController,
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white),
                          labelStyle: const TextStyle(color: Colors.white),
                          suffixIcon: IconButton(
                              color: Colors.black,
                              icon: Icon(_isObscure2
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _isObscure2 = !_isObscure2;
                                });
                              }),
                          filled: true,
                          fillColor: Colors.teal,
                          hintText: 'Confirm Password',
                          enabled: true,
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 15.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: greenColor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(color: greenColor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (value) {
                          if (confirmpassController.text !=
                              passwordController.text) {
                            return "Password did not match";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {},
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Role : ",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          DropdownButton<String>(
                            dropdownColor: Colors.grey,
                            isDense: true,
                            isExpanded: false,
                            alignment: Alignment.center,
                            iconEnabledColor: Colors.black,
                            menuMaxHeight: 100,
                            focusColor: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                            items: options.map((String dropDownStringItem) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringItem,
                                child: Text(
                                  dropDownStringItem,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValueSelected) {
                              setState(() {
                                _currentItemSelected = newValueSelected!;
                                role = newValueSelected;
                              });
                            },
                            value: _currentItemSelected,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              showProgress = true;
                            });
                            signUp(nameController.text, emailController.text,
                                passwordController.text, role,phoneController.text,addressController.text);
                          },
                          child: "Register"
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
                              .make()),
                      if (_isLoading) const Center(child: CircularProgressIndicator()),
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'I have an account,',
                            style: TextStyle(fontFamily: 'Arial'),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.to(() => const LoginPage());
                              },
                              child: 'Login'
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
          ],
        ),
      ),
    );
  }

  //Backend Auth

  void signUp(String name, String email, String password, String role,String phone,String address) async {
    try {
      if (_formkey.currentState!.validate()) {
        setState(() {
          _isLoading = true; // Show circular progress indicator
        });
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {
                  postDetailsToFirestore(
                    name,
                    email,
                    password,
                    role,
                    phone,
                    address,
                  )
                })
            .then((value) {
          Utils.toastMessage('User Create SuccessFully');
        }).onError((error, stackTrace) => Utils.toastMessage(error.toString()));
      }
    } catch (e) {
      Utils.toastMessage(e.toString());
    }finally {
      setState(() {
        _isLoading = false; // Hide circular progress indicator
      });
    }
  }

  postDetailsToFirestore(
      
    String name,
    String email,
    String password,
    String role,
      String phone,
      String address,
  ) async {
    // ignore: unused_local_variable
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    ref.doc(user!.uid).set({
      'name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'role': role,
      'phone': phoneController.text,
      'address': addressController.text,
      'image': '',
      'uid': user.uid,
    });
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}
