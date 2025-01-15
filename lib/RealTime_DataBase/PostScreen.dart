import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:pureit/utils/utils.dart';
import 'package:pureit/RealTime_DataBase/Add_Post.dart';
import 'package:pureit/Auth/Login_Screen.dart';
import 'package:firebase_core/firebase_core.dart';

class Postscreen extends StatefulWidget {
  const Postscreen({super.key});

  @override
  State<Postscreen> createState() => _PostscreenState();
}

class _PostscreenState extends State<Postscreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final firebaseRef = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL:
        'https://pureit-ed7e1-default-rtdb.asia-southeast1.firebasedatabase.app',
  ).ref('Employ');
  TextEditingController edittingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Screen'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () async {
              try {
                {
                  await _auth.signOut();
                  if (mounted) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    });
                  }
                }
              } catch (error) {
                Utils.toastMessage(error.toString());
              }
            },
            icon: const Icon(Icons.logout_outlined),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
              query: firebaseRef,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                String tittle = snapshot.child('tittle').value.toString();
                String id = snapshot.child('Id').value.toString();
                return ListTile(
                  title: Text(tittle),
                  subtitle: Text(id),
                  trailing: PopupMenuButton(
                      icon: const Icon(Icons.more_vert),
                      itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 1,
                              child: ListTile(
                                leading: Icon(Icons.edit),
                                title: Text('Edit'),
                                onTap: () {
                                  Navigator.pop(context);
                                  showEdDialog(tittle, id);
                                },
                              ),
                            ),
                            PopupMenuItem(
                              value: 1,
                              child: ListTile(
                                leading: Icon(Icons.delete),
                                title: Text('Delete'),
                                onTap: () {
                                  Navigator.pop(context);
                                  firebaseRef.child(id).remove();
                                },
                              ),
                            )
                          ]),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddPost()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> showEdDialog(String tittle, id) async {
    edittingController.text = tittle;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Update'),
            content: TextFormField(
              controller: edittingController,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    firebaseRef.child(id).update({
                      'tittle': edittingController.text.toString()
                    }).then((value) {
                      Utils.toastMessage('Post Updated Successfully');
                    }).onError(
                      (error, stackTrace) {
                        Utils.toastMessage(error.toString());
                      },
                    );
                  },
                  child: Text('Edit')),
            ],
          );
        });
  }
}
