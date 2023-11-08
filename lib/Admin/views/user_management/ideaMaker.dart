import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ideafront/IdeaMaker/consts/consts.dart';

import '../../../utils/utils.dart';
import '../home/menu_widget.dart';

class IdeaMakerUser extends StatelessWidget {
  IdeaMakerUser({super.key});
  final CollectionReference<Map<String, dynamic>> ref = FirebaseFirestore
      .instance.collection('users');

  // final ref=FirebaseFirestore.instance.doc('users');
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> _deleteInvestor(String ideaId, String role) async {
    try {
      // Get the currently signed-in user (admin)
      User? adminUser = _auth.currentUser;
      if (adminUser != null) {
        // Check if the current user (admin) is trying to delete themselves
        if (adminUser.uid != ideaId) {
          // Check if the user to be deleted is an investor
          if (role == 'IdeaMaker') {

            await ref.doc(ideaId).delete();

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
            child: MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: NewColor, // Set the desired color for button 1
              textColor: darkFontGrey, // Set the text color for button 1
              child: const Text('Investor'),
            ),
          ),
          4.widthBox,
          Expanded(
            child: Material(
              elevation: 10,
              clipBehavior: Clip.antiAlias,
              child: MaterialButton(
                onPressed: () {
                  // Add your button 2 action here
                },
                color: golden, // Set the desired color for button 2
                textColor: Colors.white, // Set the text color for button 2
                child: const Text('IdeaMaker',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              ),
            ),
          ),
          10.widthBox,
        ],
      ),
            Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: ref.where('role', isEqualTo: 'IdeaMaker').snapshots(),
                builder: (context, AsyncSnapshot<
                    QuerySnapshot<Map<String, dynamic>>>snapshot) {
                  if (snapshot.hasData) {
                    final List<QueryDocumentSnapshot<Map<String,
                        dynamic>>> idea = snapshot.data!.docs;
                    return ListView.builder(
                        itemCount: idea.length,
                        itemBuilder: (context, index) {
                          final ideaIndex = idea[index];
                          final ideaImage = ideaIndex['image'] as String;
                          final ideaId = ideaIndex['uid'] as String;
                          final idearole=ideaIndex['role']as String;

                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(ideaImage),),
                            title: Text(ideaIndex['name'],style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Phone:    ${ideaIndex['phone']}'),
                                4.heightBox,

                                Text(
                                    'Address:    ${ideaIndex['address']}'),
                                4.heightBox,

                                Text('email:    ${ideaIndex['email']}'),
                                4.heightBox,
                                Text('UId:   ${ideaIndex['uid']}'),

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
                                          onPressed: () {
                                            _deleteInvestor(ideaId,idearole);
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
