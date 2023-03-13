import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/EmergencyAmbulance.dart';
import 'package:flutter_application_1/bot1.dart';
import 'package:flutter_application_1/emergency.dart';
import 'package:flutter_application_1/emergencyCall.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/hospitalPage.dart';
import 'package:flutter_application_1/map.dart';
// import 'package:flutter_application_1/myTest.dart';
import 'package:flutter_application_1/myTest2.dart';
import 'package:flutter_application_1/pregnantImage.dart';
// import 'package:flutter_application_1/signIn.dart';
import 'package:flutter_application_1/signUp.dart';
import 'package:flutter_application_1/upload.dart';
import 'package:flutter_application_1/num.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Bot1(),
    Emergency(),
    EmergencyAmbulance(),
    EmergencyCall(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String imageUrl = '';
  String imageUrl1 = '';
  String imageUrl2 = '';
  String imageUrl3 = '';
  String imageUrl4 = '';
  String imageUrl5 = '';
  String imageUrl6 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'MyMedico',
          style: TextStyle(fontSize: 24, color: Color.fromARGB(255, 48, 7, 35)),
        ),
        backgroundColor: const Color.fromARGB(255, 197, 228, 228),
        shadowColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    // delegate to customize the search bar
                    delegate: CustomSearchDelegate());
              },
              icon: const Icon(
                Icons.search,
                size: 28,
              )),
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    backgroundColor: Color.fromARGB(255, 216, 239, 245),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    context: context,
                    builder: (context) => Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            ExpansionTile(
                              backgroundColor:
                                  Color.fromARGB(255, 195, 190, 236),
                              title: const Text(
                                ' My Input Data',
                                style: TextStyle(
                                    fontSize: 21,
                                    color: Color.fromARGB(255, 70, 4, 26)),
                              ),
                              children: [
                                const Divider(
                                  height: 1,
                                  thickness: 2,
                                  color: Colors.black,
                                ),
                                ListTile(
                                  onTap: () {
                                    preg();
                                  },
                                  title: const Text(
                                    'Pregnancy',
                                    style: TextStyle(fontSize: 19),
                                  ),
                                  leading: const Icon(
                                    Icons.add,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                ),
                                const Divider(
                                  height: 1,
                                  thickness: 2,
                                  color: Colors.black,
                                ),
                                ListTile(
                                  onTap: () {
                                    med();
                                  },
                                  title: const Text(
                                    'Medical History',
                                    style: TextStyle(fontSize: 19),
                                  ),
                                  leading: const Icon(
                                    Icons.add,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                ),
                                const Divider(
                                  height: 1,
                                  thickness: 2,
                                  color: Colors.black,
                                ),
                                ListTile(
                                  onTap: () {
                                    emg();
                                  },
                                  title: const Text(
                                    'Emergency Aid',
                                    style: TextStyle(fontSize: 19),
                                  ),
                                  leading: const Icon(
                                    Icons.add,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                ),
                                const Divider(
                                  height: 1,
                                  thickness: 2,
                                  color: Colors.black,
                                ),
                                ListTile(
                                  onTap: () {
                                    onl();
                                  },
                                  title: const Text(
                                    'Online Chat',
                                    style: TextStyle(fontSize: 19),
                                  ),
                                  leading: const Icon(
                                    Icons.add,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                ),
                                const Divider(
                                  height: 1,
                                  thickness: 2,
                                  color: Colors.black,
                                ),
                                ListTile(
                                  onTap: () {
                                    medi();
                                  },
                                  title: const Text(
                                    'Medicines',
                                    style: TextStyle(fontSize: 19),
                                  ),
                                  leading: const Icon(
                                    Icons.add,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                ),
                                const Divider(
                                  height: 1,
                                  thickness: 2,
                                  color: Colors.black,
                                ),
                                ListTile(
                                  onTap: () {
                                    oth();
                                  },
                                  title: const Text(
                                    'Others',
                                    style: TextStyle(fontSize: 19),
                                  ),
                                  leading: const Icon(
                                    Icons.add,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            )
                          ],
                        ));
              },
              icon: const Icon(
                Icons.more_vert,
                size: 26,
              ))
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 211, 224, 224),
        width: 250,
        child: Column(children: [
          const SizedBox(
            height: 70,
          ),
          const Divider(
            thickness: 2,
            color: Colors.black,
            indent: 25,
            endIndent: 25,
          ),
          ListTile(
            onTap: () {
              showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                builder: (BuildContext context, Widget? child) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: child!,
                  );
                },
              );
            },
            leading: const Icon(
              Icons.person_outlined,
              color: Colors.black,
              size: 28,
            ),
            title: const Text('Appointment Time'),
          ),
          const Divider(
            thickness: 2,
            color: Colors.black,
            indent: 25,
            endIndent: 25,
          ),
          ListTile(
            onTap: () {
              _selectDate(context);
            },
            leading: const Icon(
              Icons.favorite_outline,
              color: Colors.black,
              size: 28,
            ),
            title: const Text('Appointment Date'),
          ),
          const Divider(
            thickness: 2,
            color: Colors.black,
            indent: 25,
            endIndent: 25,
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            leading: const Icon(
              Icons.cancel,
              color: Colors.black,
              size: 28,
            ),
            title: const Text('Sign Out'),
          ),
          const Divider(
            thickness: 2,
            color: Colors.black,
            indent: 25,
            endIndent: 25,
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 197, 228, 228),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 28,
              ),
              label: "home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box_outlined,
                size: 28,
              ),
              label: "add"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outlined,
              size: 28,
            ),
            label: "profile",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.emergency_outlined,
                size: 28,
              ),
              label: "add"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 4,
        selectedItemColor: const Color.fromARGB(255, 17, 1, 7),
        unselectedItemColor: const Color.fromARGB(255, 112, 109, 111),
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> preg() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    // print('${file?.path}');
    if (file == null) return;
    final FirebaseAuth auth = FirebaseAuth.instance;
    String uniqueFileName = DateTime.now().microsecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('pregData');
    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);
    try {
      await referenceImageToUpload.putFile(File(file.path));
      imageUrl1 = await referenceImageToUpload.getDownloadURL();
      CollectionReference an =
          FirebaseFirestore.instance.collection('pregImage');
      await an.add({'url': imageUrl1, 'content': ''});
    } catch (error) {
      print('$error');
    }
  }

  Future<void> med() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    // print('${file?.path}');
    if (file == null) return;
    final FirebaseAuth auth = FirebaseAuth.instance;
    String uniqueFileName = DateTime.now().microsecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('medData');
    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);
    try {
      await referenceImageToUpload.putFile(File(file.path));
      imageUrl1 = await referenceImageToUpload.getDownloadURL();
      CollectionReference an =
          FirebaseFirestore.instance.collection('medImage');
      await an.add({'url': imageUrl1, 'content': ''});
    } catch (error) {
      print('$error');
    }
  }

  Future<void> emg() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    // print('${file?.path}');
    if (file == null) return;
    final FirebaseAuth auth = FirebaseAuth.instance;
    String uniqueFileName = DateTime.now().microsecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('emgData');
    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);
    try {
      await referenceImageToUpload.putFile(File(file.path));
      imageUrl1 = await referenceImageToUpload.getDownloadURL();
      CollectionReference an =
          FirebaseFirestore.instance.collection('emgImage');
      await an.add({'url': imageUrl1, 'content': ''});
    } catch (error) {
      print('$error');
    }
  }

  Future<void> onl() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    // print('${file?.path}');
    if (file == null) return;
    final FirebaseAuth auth = FirebaseAuth.instance;
    String uniqueFileName = DateTime.now().microsecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('onlData');
    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);
    try {
      await referenceImageToUpload.putFile(File(file.path));
      imageUrl1 = await referenceImageToUpload.getDownloadURL();
      CollectionReference an =
          FirebaseFirestore.instance.collection('onlImage');
      await an.add({'url': imageUrl1, 'content': ''});
    } catch (error) {
      print('$error');
    }
  }

  Future<void> medi() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    // print('${file?.path}');
    if (file == null) return;
    final FirebaseAuth auth = FirebaseAuth.instance;
    String uniqueFileName = DateTime.now().microsecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('mediData');
    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);
    try {
      await referenceImageToUpload.putFile(File(file.path));
      imageUrl1 = await referenceImageToUpload.getDownloadURL();
      CollectionReference an =
          FirebaseFirestore.instance.collection('mediImage');
      await an.add({'url': imageUrl1, 'content': ''});
    } catch (error) {
      print('$error');
    }
  }

  Future<void> oth() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    // print('${file?.path}');
    if (file == null) return;
    final FirebaseAuth auth = FirebaseAuth.instance;
    String uniqueFileName = DateTime.now().microsecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('othData');
    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);
    try {
      await referenceImageToUpload.putFile(File(file.path));
      imageUrl1 = await referenceImageToUpload.getDownloadURL();
      CollectionReference an =
          FirebaseFirestore.instance.collection('othImage');
      await an.add({'url': imageUrl1, 'content': ''});
    } catch (error) {
      print('$error');
    }
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    "P. Manipal Hospital ",
    "D. Vamsi Heart Care",
    "G. Ramesh Hospitals",
    "Sanjeevani Hospital",
    "Srikara Hospitals",
    "Sai Varnha Eye Hospital",
    "Emergency Vijaya Hospitals",
    "Healing Hand Physiotharphy and Reahabitation Clinic",
    "AIIMS",
    "Bara Hindu Rao Hospital",
    "Deen Dayal Upadhyaya",
    "Sir Ganga Ram Hospital, Pusa Road",
    "Maharaja Agrasan, Punjabi Bagh",
    "Meta Chanan Dev, Janak Puri",
    "LNJP, Delhi Gate",
    "Max Medcentre",
    "Ram Manohar Lohia,, Central Secretariat",
    "Safdarjung Hospital",
    "Escorts Heart Institute & Res. Ctr., Okhla",
    "G. B. Pant Hospital, Delhi Gate"
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          Icons.clear,
          color: Colors.black,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          trailing: Icon(Icons.more_vert),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HospitalPage(Name: result)));
            },
            child: ListTile(
              tileColor: const Color.fromARGB(255, 121, 184, 178),
              leading: const Icon(
                Icons.send_outlined,
                size: 28,
                color: Color.fromARGB(255, 27, 3, 11),
              ),
              title: Text(
                result,
                style: const TextStyle(
                  fontSize: 21,
                  color: Color.fromARGB(255, 27, 3, 11),
                ),
              ),
              subtitle: const Text(
                'medical and health center',
                style: TextStyle(
                  fontSize: 17,
                  color: Color.fromARGB(255, 253, 252, 184),
                ),
              ),
              trailing: const Icon(
                Icons.more_vert,
                size: 28,
                color: Color.fromARGB(255, 27, 3, 11),
              ),
            ),
          ),
        );
      },
    );
  }
}
