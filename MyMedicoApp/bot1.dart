import 'package:flutter/material.dart';
import 'package:flutter_application_1/emergencyAd.dart';
import 'package:flutter_application_1/medicalHistory.dart';
import 'package:flutter_application_1/medicines.dart';
import 'package:flutter_application_1/onlineChat.dart';
import 'package:flutter_application_1/onlineMessage.dart';
import 'package:flutter_application_1/other.dart';
import 'package:flutter_application_1/pregnantImage.dart';

class Bot1 extends StatefulWidget {
  const Bot1({super.key});

  @override
  State<Bot1> createState() => _Bot1State();
}

class _Bot1State extends State<Bot1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 221, 230, 227),
      body: Padding(
        padding: const EdgeInsets.only(left: 6, right: 6),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 80,
                color: Color.fromARGB(255, 142, 113, 196),
                child: Row(
                  children: const [
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://thumbs.dreamstime.com/b/baby-boy-posing-2607278.jpg'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Hiii Chetan',
                      style: TextStyle(
                          fontSize: 26,
                          color: Color.fromARGB(255, 252, 251, 249)),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Ink(
                height: 100,
                color: const Color.fromARGB(255, 226, 193, 230),
                child: Center(
                  child: ListTile(
                    title: const Text(
                      'Pregnancy',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    leading: const Icon(
                      Icons.medication,
                      size: 34,
                      color: Color.fromARGB(255, 36, 4, 15),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PregnantImage()));
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Ink(
                height: 100,
                color: const Color.fromARGB(255, 226, 193, 230),
                child: Center(
                  child: ListTile(
                    title: const Text(
                      'Medical History',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    leading: const Icon(
                      Icons.medication,
                      size: 34,
                      color: Color.fromARGB(255, 36, 4, 15),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MedicalHistory()));
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Ink(
                height: 100,
                color: const Color.fromARGB(255, 226, 193, 230),
                child: Center(
                  child: ListTile(
                    title: const Text(
                      'Emergency Aid',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    leading: const Icon(
                      Icons.medication,
                      size: 34,
                      color: Color.fromARGB(255, 36, 4, 15),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EmergencyAid()));
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Ink(
                height: 100,
                color: const Color.fromARGB(255, 226, 193, 230),
                child: Center(
                  child: ListTile(
                    title: const Text(
                      'Online Chat',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    leading: const Icon(
                      Icons.medication,
                      size: 34,
                      color: Color.fromARGB(255, 36, 4, 15),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OnlineMessage()));
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Ink(
                height: 100,
                color: const Color.fromARGB(255, 226, 193, 230),
                child: Center(
                  child: ListTile(
                    title: const Text(
                      'Medicines',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    leading: const Icon(
                      Icons.medication,
                      size: 34,
                      color: Color.fromARGB(255, 36, 4, 15),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Medicines()));
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Ink(
                height: 100,
                color: const Color.fromARGB(255, 226, 193, 230),
                child: Center(
                  child: ListTile(
                    title: const Text(
                      'Others',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    leading: const Icon(
                      Icons.medication,
                      size: 34,
                      color: Color.fromARGB(255, 36, 4, 15),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Others()));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
