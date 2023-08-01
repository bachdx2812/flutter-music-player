import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/discover_music.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/playlists.dart';
import '../widgets/trending_mucics.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepPurple.shade800.withOpacity(0.8),
            Colors.deepPurple.shade200.withOpacity(0.8),
          ],
        ),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(),
        bottomNavigationBar: CustomNavigationBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              DiscoverMusic(),
              TrendingMusic(),
              Playlists(),
            ],
          ),
        ),
      ),
    );
  }
}
