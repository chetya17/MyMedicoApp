import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/signUp.dart';

class Forg extends StatefulWidget {
  const Forg({super.key});

  @override
  State<Forg> createState() => _ForgState();
}

class _ForgState extends State<Forg> {
  TextEditingController userCont1 = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    userCont1.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 171, 173, 173),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            const Icon(
              Icons.person_outline,
              size: 70,
              color: Color.fromARGB(255, 71, 71, 71),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: SizedBox(
                width: 270,
                child: TextField(
                  controller: userCont1,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 54, 6, 22), width: 2)),
                      hintText: 'enter username',
                      filled: true,
                      fillColor: Color.fromARGB(255, 233, 228, 230)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: signIn,
              child: Text('reset your password'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 77, 151, 156)),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: userCont1.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
