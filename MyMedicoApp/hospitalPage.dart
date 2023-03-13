import 'package:flutter/material.dart';

class HospitalPage extends StatefulWidget {
  final String Name;
  const HospitalPage({super.key, required this.Name});

  @override
  State<HospitalPage> createState() => _HospitalPageState();
}

class _HospitalPageState extends State<HospitalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 189, 213, 214),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color.fromARGB(255, 193, 218, 224),
        centerTitle: true,
        title: Text(
          widget.Name,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Column(children: [
        const SizedBox(
          height: 30,
        ),
        const Center(
          child: Text(
            'Welcome',
            style:
                TextStyle(fontSize: 29, color: Color.fromARGB(255, 107, 7, 40)),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Center(
          child: ListTile(
            tileColor: Color.fromARGB(255, 97, 153, 148),
            title: Text(
              widget.Name,
              style: const TextStyle(fontSize: 24),
            ),
            leading: const Icon(
              Icons.send_outlined,
              color: Colors.black,
            ),
            trailing: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Center(
          child: ListTile(
            tileColor: Color.fromARGB(255, 97, 153, 148),
            title: Text(
              "our team",
              style: const TextStyle(fontSize: 24),
            ),
            leading: Icon(
              Icons.send_outlined,
              color: Colors.black,
            ),
            trailing: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Center(
          child: ListTile(
            tileColor: Color.fromARGB(255, 97, 153, 148),
            title: Text(
              "check Ups",
              style: const TextStyle(fontSize: 24),
            ),
            leading: Icon(
              Icons.send_outlined,
              color: Colors.black,
            ),
            trailing: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Center(
          child: ListTile(
            tileColor: Color.fromARGB(255, 97, 153, 148),
            title: Text(
              "surgery",
              style: const TextStyle(fontSize: 24),
            ),
            leading: Icon(
              Icons.send_outlined,
              color: Colors.black,
            ),
            trailing: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          color: Color.fromARGB(255, 134, 150, 168),
          width: 330,
          height: 130,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.Name,
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Contact us : 6396937375',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Mail us : anoop',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
