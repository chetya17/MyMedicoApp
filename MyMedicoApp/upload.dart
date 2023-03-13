import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MyUpload extends StatefulWidget {
  const MyUpload({super.key});

  @override
  State<MyUpload> createState() => _MyUploadState();
}

class _MyUploadState extends State<MyUpload> {
  String imgUrl = '';
  PlatformFile? pickedFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                child: const Text('upload  file'),
                onPressed: () {
                  pickImage();
                }),
          ],
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
    final path = 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    try {
      await ref.putFile(file);

      imgUrl = await ref.getDownloadURL();
      CollectionReference fr = FirebaseFirestore.instance.collection('myFiles');
      await fr.add({'fileUrl': imgUrl});
    } catch (e) {
      print('hhhhhhhhhhhhhhhh$e');
    }
  }
}
