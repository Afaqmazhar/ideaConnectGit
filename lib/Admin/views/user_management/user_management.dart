import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ideafront/Admin/views/user_management/ideaMaker.dart';
import 'package:ideafront/IdeaMaker/consts/consts.dart';
import '../../../utils/utils.dart';
import '../home/menu_widget.dart';

class UserManagement extends StatelessWidget {
  UserManagement({super.key});

  final CollectionReference<Map<String, dynamic>> ref = FirebaseFirestore
      .instance.collection('users');

  // final ref=FirebaseFirestore.instance.doc('users');
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Future<void> _deleteInvestor(String investorId, String role) async {
  //   try {
  //     // Get the currently signed-in user (admin)
  //     User? adminUser = _auth.currentUser;
  //     if (adminUser != null) {
  //       // Check if the current user (admin) is trying to delete themselves
  //       if (adminUser.uid != investorId) {
  //         // Check if the user to be deleted is an investor
  //         if (role == 'Investor') {
  //           // Find the investor's user object from the userChanges() stream
  //           User? investorUser;
  //           _auth.userChanges().listen((user) {
  //             if (user!.uid == investorId) {
  //               investorUser = user;
  //             }
  //           });
  //
  //           // Wait for a short duration to give time for the userChanges() stream to emit the user
  //           await Future.delayed(const Duration(seconds: 1));
  //
  //           if (investorUser != null) {
  //             // Delete the investor's account from Firebase Authentication
  //             await investorUser!.delete();
  //
  //             // Delete the document associated with the investor from Firestore
  //             await ref.doc(investorId).delete();
  //
  //             Utils.toastMessage('Investor account deleted successfully');
  //           } else {
  //             Utils.toastMessage("Investor user not found.");
  //           }
  //         } else {
  //           Utils.toastMessage("Only investors can be deleted.");
  //         }
  //       } else {
  //         Utils.toastMessage("Admin cannot delete themselves.");
  //       }
  //     }
  //   } catch (e) {
  //     Utils.toastMessage('Error deleting investor: $e');
  //     log('$e');
  //   }
  // }
  Future<void> _deleteInvestor(String investorId, String role) async {
    try {
      // Get the currently signed-in user (admin)
      User? adminUser = _auth.currentUser;
      if (adminUser != null) {
        // Check if the current user (admin) is trying to delete themselves
        if (adminUser.uid != investorId) {
          // Check if the user to be deleted is an investor
          if (role == 'Investor') {

              await ref.doc(investorId).delete();

              Utils.toastMessage('Investor account deleted successfully');

          } else {
            Utils.toastMessage("Only investors can be deleted.");
          }
        } else {
          Utils.toastMessage("Admin cannot delete themselves.");
        }
      }
    } catch (e) {
      Utils.toastMessage('Error deleting investor: $e');
      log('$e');
    }
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('All User'),
          leading: MenuWidget(),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Search',
                          suffixIcon: const Icon(Icons.search),
                          // Set border for enabled state (default)
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(width: 3, color: Colors.blue),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          // Set border for focused state
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(width: 3, color: Colors.red),
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  10.widthBox,
                  Expanded(
                    child: Material(
                      elevation: 10,
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(10),
                      child: MaterialButton(
                        onPressed: () {
                          // Add your button 1 action here
                        },

                        color: NewColor,
                        // Set the desired color for button 1
                        textColor: Colors.white,
                        // Set the text color for button 1
                        child: const Text('Investor', style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ),
                  4.widthBox,
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        Get.to(() => IdeaMakerUser());
                      },
                      color: golden,
                      // Set the desired color for button 2
                      textColor: darkFontGrey,
                      // Set the text color for button 2
                      child: const Text('IdeaMaker'),
                    ),
                  ),
                  10.widthBox,
                ],
              ),
              //now we show all investors at there
              Expanded(
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: ref.where('role', isEqualTo: 'Investor').snapshots(),
                  builder: (context, AsyncSnapshot<
                      QuerySnapshot<Map<String, dynamic>>>snapshot) {
                    if (snapshot.hasData) {
                      final List<QueryDocumentSnapshot<Map<String,
                          dynamic>>> investor = snapshot.data!.docs;
                      return ListView.builder(
                          itemCount: investor.length,
                          itemBuilder: (context, index) {
                            final investorIndex = investor[index];
                            final investorImage = investorIndex['image'] as String;
                            final investorId = investorIndex['uid'] as String;
                            final investorrole=investorIndex['role']as String;
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(investorImage),),
                              title: Text(investorIndex['name'],style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Phone:    ${investorIndex['phone']}'),
                                  4.heightBox,
                                  Text(
                                      'Address:    ${investorIndex['address']}'),
                                  4.heightBox,
                                  Text('email:    ${investorIndex['email']}'),
                                  4.heightBox,
                                  Text('UId:     $investorId'),
                                  const Divider(),
                                ],
                              ),
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.delete, color: Colors.red,),
                                onPressed: () {
                                  showDialog(
                                      context: context, builder: (context) {
                                    return AlertDialog(
                                      title: const Text(
                                          'Do You want to delete this account'),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              'cancel',
                                              style: TextStyle(
                                                  color: Colors.red),
                                            )),
                                        TextButton(
                                            onPressed: () async{

                                              _deleteInvestor(investorId,investorrole);
                                              Navigator.pop(context);
                                            },
                                            child: const Text('ok')),
                                      ],

                                    );
                                  });
                                },
                              ),
                            );
                          });
                    }
                    else if (snapshot.hasError) {
                      return Center(
                        child: Utils.toastMessage(snapshot.error.toString()),
                      );
                    }
                    else {
                      return const Center(
                        child: Text('No User'),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      );
    }
}
