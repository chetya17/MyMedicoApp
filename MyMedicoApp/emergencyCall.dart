import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EmergencyCall extends StatelessWidget {
  const EmergencyCall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 205, 226, 228),
      body: Center(
        child: InkWell(
          onTap: () {
            cal();
          },
          child: Container(
            color: Color.fromARGB(255, 126, 130, 190),
            height: 100,
            width: 250,
            child: const Center(
                child: Text(
              'make an emergency call',
              style: TextStyle(
                  fontSize: 22, color: Color.fromARGB(255, 10, 9, 10)),
            )),
          ),
        ),
      ),
    );
  }

  Future<void> cal() async {
    try {
      CollectionReference an =
          FirebaseFirestore.instance.collection('emergencyCall');
      await an.add({
        'phone no': "6396937375",
        'location':
            ' MENS HOSTEL 1 ,VIT-AP UNIVERSITY ,VIJAYAWADA ANDHRA PRADESH '
      });
    } catch (error) {
      print('$error');
    }
  }
}
