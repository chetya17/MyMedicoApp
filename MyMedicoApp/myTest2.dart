import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_1/home.dart';
import 'package:image_picker/image_picker.dart';

class MyTest2 extends StatefulWidget {
  const MyTest2({super.key});

  @override
  State<MyTest2> createState() => _MyTest2State();
}

class _MyTest2State extends State<MyTest2> {
  TextEditingController Mycontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    Mycontroller.dispose();
  }

  String imageUrl = '';
  String imageUrl1 = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 60,
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: TextField(
            controller: Mycontroller,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: 'please share your thoughts here',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(10),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
          // icon: const Icon(Icons.add),
          child: const Text('upload your images'),
          onPressed: () {
            myPut();
          },
        ),
        ElevatedButton(
          // icon: const Icon(Icons.add),
          child: const Text('pragnancy data'),
          onPressed: () {
            preg();
          },
        ),
      ],
    );
  }

  Future<void> myPut() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    // print('${file?.path}');
    if (file == null) return;
    final FirebaseAuth auth = FirebaseAuth.instance;
    String uniqueFileName = DateTime.now().microsecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child(auth.currentUser!.uid);
    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);
    try {
      await referenceImageToUpload.putFile(File(file.path));
      imageUrl = await referenceImageToUpload.getDownloadURL();
      CollectionReference an =
          FirebaseFirestore.instance.collection(auth.currentUser!.uid);
      await an.add({'url': imageUrl, 'content': Mycontroller.text});
    } catch (error) {
      print('$error');
    }
  }

  Future<void> preg() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    // print('${file?.path}');
    if (file == null) return;
    final FirebaseAuth auth = FirebaseAuth.instance;
    String uniqueFileName = DateTime.now().microsecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('pregData');
    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);
    try {
      await referenceImageToUpload.putFile(File(file.path));
      imageUrl1 = await referenceImageToUpload.getDownloadURL();
      CollectionReference an =
          FirebaseFirestore.instance.collection('pregImage');
      await an.add({'url': imageUrl1, 'content': Mycontroller.text});
    } catch (error) {
      print('$error');
    }
  }
}
