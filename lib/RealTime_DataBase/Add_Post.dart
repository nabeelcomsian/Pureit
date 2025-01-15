import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pureit/utils/utils.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  // Ensure the correct database URL is used
  final databaseRef = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL:
        'https://pureit-ed7e1-default-rtdb.asia-southeast1.firebasedatabase.app',
  ).ref('Employ');

  TextEditingController postController = TextEditingController();
  bool loading = false;
  @override
  dispose() {
    postController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post Screen'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            TextFormField(
              controller: postController,
              maxLines: 4,
              decoration: const InputDecoration(
                  hintText: 'What is in your mind',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(200, 60)),
                onPressed: () {
                  // debugPrint('This is a Firebase instance: $databaseRef');
                  // debugPrint(
                  //     'This is user text: ${postController.text.toString()}');
                  // Close the keyboard
                  FocusScope.of(context).unfocus();
                  String id = DateTime.now().millisecondsSinceEpoch.toString();

                  setState(() {
                    loading = true;
                  });
                  try {
                    // Example of writing data
                    databaseRef.child(id).set({
                      'Id': id,
                      'tittle': postController.text.toString(),
                    }).then((_) {
                      Utils.toastMessage("Post submitted successfully");
                      setState(() {
                        loading = false;
                      });
                    });
                    postController.clear();
                  } catch (err) {
                    Utils.toastMessage(err.toString());
                  }
                },
                child: loading
                    ? const CircularProgressIndicator()
                    : const Text('Add')),
          ],
        ),
      ),
    );
  }
}
