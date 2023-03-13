import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/login.dart';
// import 'package:flutter_application_1/myHomePage.dart';
// import 'package:flutter_application_1/myTest.dart';
// import 'package:flutter_application_1/myTest2.dart';
// import 'package:flutter_application_1/signIn.dart';
// import 'package:flutter_application_1/upload.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
