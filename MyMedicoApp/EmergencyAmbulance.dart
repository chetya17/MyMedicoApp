import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EmergencyAmbulance extends StatefulWidget {
  const EmergencyAmbulance({super.key});

  @override
  State<EmergencyAmbulance> createState() => _EmergencyAmbulanceState();
}

class _EmergencyAmbulanceState extends State<EmergencyAmbulance> {
  // TextEditingController nameCont = TextEditingController();
  TextEditingController ageCont = TextEditingController();
  TextEditingController probCont = TextEditingController();
  TextEditingController needCont = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    // nameCont.dispose();
    ageCont.dispose();
    probCont.dispose();
    needCont.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 238, 240),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
              width: 270,
              child: TextField(
                maxLines: 1,
                controller: ageCont,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 54, 6, 22), width: 2)),
                  hintText: 'Enter the location',
                  filled: true,
                  fillColor: Color.fromARGB(255, 233, 228, 230),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: SizedBox(
              width: 270,
              child: TextField(
                maxLines: 2,
                controller: needCont,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 54, 6, 22), width: 2)),
                  hintText: 'patient description',
                  filled: true,
                  fillColor: Color.fromARGB(255, 233, 228, 230),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: SizedBox(
              width: 270,
              child: TextField(
                maxLines: 4,
                controller: probCont,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 54, 6, 22), width: 2)),
                  hintText: 'enter emergency requirements',
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
    );
  }

  Future<void> myPut() async {
    CollectionReference em =
        FirebaseFirestore.instance.collection('emergencyAmbulance');
    try {
      await em.add({
        'location': ageCont.text,
        'description': needCont.text,
        'requirements': probCont.text
      });
    } catch (e) {
      print('$e');
    }

    ageCont.text = '';
    needCont.text = '';
    probCont.text = '';
  }
}
