import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../IdeaMaker/consts/consts.dart';
import '../session/session.dart';
import '../utils/utils.dart';

class ProfileController with ChangeNotifier {
  //creating Controller
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  // Now we initialize the firebase Reference to save image to firebase database
  final ref = FirebaseFirestore.instance.collection('users');
  // DatabaseReference ref=FirebaseDatabase.instance.ref().child('users');

  //Now we initialize firebase storage

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

//now we do the image picker code
  final picker = ImagePicker();

  //Loading method
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

//as we know when we pick image the path comes in the form of file
  XFile? _image; //at there we store image path if picked
  XFile? get image =>
      _image; //getter provide access others parts of code outside the class

  //Now what should we do is picking image from Gallery
  Future pickGalleryImage(BuildContext context) async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    //now we save this picked image to our above variable
    if (pickedFile != null) {
      _image = XFile(pickedFile.path);
      uploadImage(context);
      notifyListeners();
    }
  }

  //Now what should we do is picking image from Camera

  Future pickCameraImage(BuildContext context) async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 100);
    //now we save this picked image to our above variable
    if (pickedFile != null) {
      _image = XFile(pickedFile.path);
      uploadImage(context);
      notifyListeners();
    }
  }

  //first i wants to know about the user that he wants to pick image from gallery or camera
  void pickImage(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
              height: 120,
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      pickCameraImage(context);
                      Navigator.pop(context);
                    },
                    leading: const Icon(
                      Icons.camera,
                      color: Colors.black,
                    ),
                    title: const Text('Camera'),
                  ),
                  ListTile(
                    onTap: () {
                      pickGalleryImage(context);
                      Navigator.pop(context);
                    },
                    leading: const Icon(
                      Icons.image,
                      color: Colors.black,
                    ),
                    title: const Text('Gallery'),
                  ),
                ],
              ),
            ),
          );
        });
  }

  //Now we Upload Image to the database
  // ignore: avoid_types_as_parameter_names
  void uploadImage(BuildContext) async {
    setLoading(true);
    firebase_storage.Reference storageRef = firebase_storage
        .FirebaseStorage.instance
        .ref('/profileImage${SessionController().userid.toString()}');
    firebase_storage.UploadTask uploadTask =
        storageRef.putFile(File(image!.path).absolute);

//await we will await below until the image will upload
    await Future.value(uploadTask);
    final newUrl = await storageRef.getDownloadURL();

//now we save that image to current user node

    ref
        .doc(SessionController().userid.toString())
        .update({'image': newUrl}).then((value) {
      Utils.toastMessage('Profile Updated');
      nameController.clear();
      setLoading(false);
      _image = null;
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.toastMessage(error.toString());
      nameController.clear();
    });
  }

  //Now we wants to change the remaining profile

//Username Code
  Future<void> showNameDialogueAlert(BuildContext context, String name) {
    //at there we will passing previous name to controller
    nameController.text = name;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Update Name'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  //we use our name
                  TextFormField(
                    controller: nameController,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.white),
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.blueGrey,
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
                    keyboardType: TextInputType.text,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'cancel',
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () {
                    ref
                        .doc(SessionController().userid.toString())
                        .update({'name': nameController.text})
                        .then((value) => Utils.toastMessage('Name is Updated'))
                        .onError((error, stackTrace) =>
                            Utils.toastMessage(error.toString()));
                    Navigator.pop(context);
                  },
                  child: const Text('ok')),
            ],
          );
        });
  }

  //Phone Number Code
  Future<void> showPhoneDialogueAlert(BuildContext context, String phone) {
    //at there we will passing previous name to controller
    phoneController.text = phone;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Update PhoneNo.'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  //we use our name
                  TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.white),
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.blueGrey,
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
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'cancel',
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () {
                    ref
                        .doc(SessionController().userid.toString())
                        .update({'phone': phoneController.text})
                        .then((value) =>
                            Utils.toastMessage('PhoneNo. is Updated'))
                        .onError((error, stackTrace) =>
                            Utils.toastMessage(error.toString()));
                    Navigator.pop(context);
                  },
                  child: const Text('ok')),
            ],
          );
        });
  }

  //Address Code
  Future<void> showaddressDialogueAlert(BuildContext context, String address) {
    //at there we will passing previous name to controller
    addressController.text = address;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Update Address'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  //we use our name
                  TextFormField(
                    controller: addressController,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.white),
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.blueGrey,
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
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'cancel',
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () {
                    ref
                        .doc(SessionController().userid.toString())
                        .update({'address': addressController.text})
                        .then(
                            (value) => Utils.toastMessage('Address is Updated'))
                        .onError((error, stackTrace) =>
                            Utils.toastMessage(error.toString()));
                    Navigator.pop(context);
                  },
                  child: const Text('ok')),
            ],
          );
        });
  }
}
