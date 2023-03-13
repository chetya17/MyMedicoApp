import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/feedback.dart';
// import 'package:flutter_application_1/myTest.dart';

class PregnantImage extends StatefulWidget {
  const PregnantImage({super.key});

  @override
  State<PregnantImage> createState() => _PregnantImageState();
}

class _PregnantImageState extends State<PregnantImage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: const Color.fromARGB(255, 193, 218, 224),
          centerTitle: true,
          title: const Text(
            'Pregs Tips and Diet',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Center(
          child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('pregImage').snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) => MyFeedback(
                        sr: snapshot.data!.docs[index].get('url'),
                        tx: snapshot.data!.docs[index].get('content'),
                      ));
            },
          ),
        ));
  }
}
