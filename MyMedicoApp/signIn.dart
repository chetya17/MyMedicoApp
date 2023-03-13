import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/forget.dart';
import 'package:flutter_application_1/signUp.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController userCont = TextEditingController();
  TextEditingController passCont = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    userCont.dispose();
    passCont.dispose();
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
                  controller: userCont,
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
                  controller: passCont,
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
              onPressed: signIn,
              child: Text('signIn'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 77, 151, 156)),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Forg()));
              },
              child: const Text(
                'forgot password?',
                style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(186, 136, 21, 98),
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "don't have an account ?",
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Signup()));
                  },
                  child: const Text(
                    "signUp Now",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 19, 93, 153),
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userCont.text.trim(), password: passCont.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
