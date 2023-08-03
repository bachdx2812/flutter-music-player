import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../configurations/colors_config.dart';

import '../controllers/songs_controller.dart';

class DiscoverMusic extends StatefulWidget {
  const DiscoverMusic({super.key});

  @override
  State<DiscoverMusic> createState() => _DiscoverMusicState();
}

class _DiscoverMusicState extends State<DiscoverMusic> {
  static final SongsController _songsController = Get.put(SongsController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Enjoy your favorite music',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            style: TextStyle(color: ColorsConfig.primary),
            onChanged: (String? text) {},
            onFieldSubmitted: (value) {
              setState(() {
                _songsController.setSearchText(value);
              });

              _songsController.fetchSongs();
            },
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.white,
              hintText: _songsController.searchText.value,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.grey.shade400),
              prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}
