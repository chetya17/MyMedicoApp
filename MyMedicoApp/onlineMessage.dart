import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OnlineMessage extends StatefulWidget {
  const OnlineMessage({super.key});

  @override
  State<OnlineMessage> createState() => _OnlineMessageState();
}

class _OnlineMessageState extends State<OnlineMessage> {
  TextEditingController nameCont = TextEditingController();
  // TextEditingController ageCont = TextEditingController();
  TextEditingController probCont = TextEditingController();
  // TextEditingController needCont = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameCont.dispose();
    // ageCont.dispose();
    probCont.dispose();
    // needCont.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 238, 240),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color.fromARGB(255, 193, 218, 224),
        centerTitle: true,
        title: const Text(
          'Online Communication',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Center(
              child: SizedBox(
                width: 270,
                child: TextField(
                  maxLines: 2,
                  controller: nameCont,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 54, 6, 22), width: 2)),
                    hintText: 'please enter problem',
                    filled: true,
                    fillColor: Color.fromARGB(255, 233, 228, 230),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                width: 270,
                child: TextField(
                  maxLines: 7,
                  controller: probCont,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 54, 6, 22), width: 2)),
                    hintText: 'Please leave your message here  ',
                    filled: true,
                    fillColor: Color.fromARGB(255, 233, 228, 230),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  myPut();
                },
                child: Text('submit'))
          ],
        ),
      ),
    );
  }

  Future<void> myPut() async {
    CollectionReference em =
        FirebaseFirestore.instance.collection('onlineMessages');
    try {
      await em.add({'problem': nameCont.text, 'message': probCont.text});
    } catch (e) {
      print('$e');
    }
    nameCont.text = '';

    probCont.text = '';
  }
}
