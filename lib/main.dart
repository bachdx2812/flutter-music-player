import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import './screens/screens.dart';

void main() async {
  await dotenv.load(fileName: '.env');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Player',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
      ),
      home: const HomeScreen(),
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/', page: () => const SongScreen()),
        GetPage(name: '/', page: () => const PlaylistScreen()),
      ],
    );
  }
}
