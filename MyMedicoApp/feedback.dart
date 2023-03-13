import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:transparent_image/transparent_image.dart';

class MyFeedback extends StatefulWidget {
  final String sr;
  final String tx;

  const MyFeedback({super.key, required this.sr, required this.tx});

  @override
  State<MyFeedback> createState() => _MyFeedbackState();
}

class _MyFeedbackState extends State<MyFeedback> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      color: Color.fromARGB(255, 244, 248, 248),
      child: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color.fromARGB(255, 241, 204, 227),
              radius: 30,
              // backgroundImage: NetworkImage(
              //   'https://media.wired.com/photos/5b92e26221429f5914431497/125:94/w_1499,h_1127,c_limit/ElonMusk-JoeRoganShow.jpg',
              // ),
            ),
            title: const Text(
              'MyMedico',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            subtitle: const Text(
              'Health tips and suggestions',
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.black,
                size: 27,
              ),
              onPressed: () {},
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          // Image.network(sr),
          // FadeInImage.memoryNetwork(
          //   placeholder: kTransparentImage,
          //   image: sr,
          // ),
          Expanded(
            child: Container(
              width: 360.0,
              height: 540.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                    widget.sr,
                    cacheManager: CacheManager(
                      Config(
                        'cacheKey',
                        stalePeriod: const Duration(days: 7),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  size: 26,
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit_outlined,
                  size: 26,
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.send_outlined,
                  size: 26,
                ),
              ),
              const SizedBox(
                width: 140,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.bookmark_border,
                  size: 26,
                ),
              )
            ],
          ),
          const Divider(
            height: 1,
            thickness: 2,
            color: Color.fromARGB(255, 70, 63, 63),
          )
        ],
      ),
    );
  }
}
