import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController userCont1 = TextEditingController();
  TextEditingController passCont1 = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    userCont1.dispose();
    passCont1.dispose();
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
            Center(
              child: SizedBox(
                width: 270,
                child: TextField(
                  controller: passCont1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 54, 6, 22), width: 2)),
                    hintText: 'enter password',
                    filled: true,
                    fillColor: Color.fromARGB(255, 233, 228, 230),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                signUp1();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 77, 151, 156)),
              child: const Text('signup'),
            )
          ],
        ),
      ),
    );
  }

  Future signUp1() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: userCont1.text.trim(), password: passCont1.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    // Navigator.pop(context);
  }
}
