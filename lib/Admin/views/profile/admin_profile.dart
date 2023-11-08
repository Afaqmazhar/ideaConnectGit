import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ideafront/controller/profile%20_controller.dart';
import 'package:provider/provider.dart';

import '../../../IdeaMaker/consts/consts.dart';
import '../../../auth/login.dart';
import '../../../session/session.dart';
import '../home/menu_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ref = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Profile'),
          leading: MenuWidget(),
        ),
        body: ChangeNotifierProvider(
          create: (_)=>ProfileController(),
          child: Consumer<ProfileController>(
            builder: (context,provider,child){
              return SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: StreamBuilder(
                      //below there we took data from server and user that session where we store userid
                        stream:
                        ref.doc(SessionController().userid.toString()).snapshots(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasData) {
                            Map<dynamic, dynamic> map =
                            snapshot.data!.data() as Map<String, dynamic>;
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                90.heightBox,
                                Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 14),
                                      child: Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black,
                                              ),
                                              shape: BoxShape.circle),
                                          height: 130,
                                          width: 130,
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(100),
                                              child:provider.image==null? map['image'] == ''
                                                  ? const Icon(
                                                Icons.person,
                                                size: 45,
                                              )
                                                  : Image(
                                                  image: NetworkImage(
                                                      map['image'].toString()),
                                                  fit: BoxFit.cover,
                                                  loadingBuilder: (context, child,
                                                      loadingProgress) {
                                                    if (loadingProgress == null)
                                                      return child;
                                                    return const Center(
                                                        child:
                                                        CircularProgressIndicator());
                                                  },
                                                  errorBuilder:
                                                      (context, object, stack) {
                                                    return const Icon(
                                                      Icons.error_outline,
                                                      color: Colors.red,
                                                    );
                                                  }):
                                              Stack(
                                                children: [
                                                  Image.file(File(provider.image!.path).absolute),
                                                  const Center(child: CircularProgressIndicator(),)
                                                ],
                                              )),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        Provider.of<ProfileController>(context,listen: false).pickImage(context);
                                      },
                                      child: const CircleAvatar(
                                        radius: 14,
                                        backgroundColor: Colors.black,
                                        child: Icon(Icons.add,size: 14,color: Colors.white,),
                                      ),
                                    )
                                  ],
                                ),
                                20.heightBox,
                                GestureDetector(
                                  onTap: (){
                                    //at there we are send our name to controller
                                    provider.showNameDialogueAlert(context,map['name']);
                                  },
                                  child: ReuseableRow(
                                      title: 'Name',
                                      value: map['name'],
                                      icondata: Icons.person),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    provider.showPhoneDialogueAlert(context,map['phone']);
                                  },
                                  child: ReuseableRow(
                                      title: 'Phone Number',
                                      value:
                                      map['phone'] == '' ? 'xxx-xxx-xxx' : map['phone'],
                                      icondata: Icons.phone_android),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    provider.showaddressDialogueAlert(context,map['address']);
                                  },
                                  child: ReuseableRow(
                                      title: 'Address',
                                      value: map['address'],
                                      icondata: Icons.email_outlined),
                                ),
                                ReuseableRow(
                                    title: 'Email',
                                    value: map['email'],
                                    icondata: Icons.email_outlined),
                                20.heightBox,
                                "Logout"
                                    .text
                                    .white
                                    .xl2
                                    .make()
                                    .centered()
                                    .box
                                    .rounded
                                    .p8
                                    .color(Colors.black)
                                    .width(360)
                                    .height(50)
                                    .make()
                                    .onTap(() {
                                  final _auth = FirebaseAuth.instance;
                                  _auth.signOut().then(
                                        (value) {
                                      SessionController().userid = '';
                                      Get.offAll(() => const LoginPage());
                                    },
                                  );
                                }),
                              ],
                            );
                          } else {
                            return const Center(
                              child: Text(
                                'Something Went Wrong',
                                style: TextStyle(fontSize: 14, color: Colors.red),
                              ),
                            );
                          }
                        }),
                  ),
                ),
              );
            },
          ),
        )
    );
  }
}

class ReuseableRow extends StatelessWidget {
  final title, value;
  final IconData icondata;
  const ReuseableRow(
      {super.key,
        required this.title,
        required this.value,
        required this.icondata});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: const TextStyle(fontSize: 14),
          ),
          leading: Icon(icondata),
          trailing: Text(
            value,
            style: const TextStyle(fontSize: 12),
          ),
        ),
        Divider(
          color: Colors.grey.withOpacity(0.5),
        )
      ],
    );
  }
}
