import 'package:flutter/material.dart';
import 'package:flutter_application_2/akun.dart';
import 'package:flutter_application_2/daftarplaylist.dart';
import 'package:flutter_application_2/homepage.dart';
import 'package:flutter_application_2/playsong.dart';

void main() {
  runApp(const MyApp());
}

class Song {
  final String title;
  final String artist;
  final String image;

  Song({
    required this.title,
    required this.artist,
    required this.image,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LikedSongsPage(),
    );
  }
}

class LikedSongsPage extends StatefulWidget {
  @override
  State<LikedSongsPage> createState() => _LikedSongsPageState();
}

class _LikedSongsPageState extends State<LikedSongsPage> {
  List<Song> songs = [
    Song(
      title: "Count on Me",
      artist: "Bruno Mars",
      image: "assets/bruno.png",
    ),
    Song(
      title: "One Less Lonely Girl",
      artist: "Justin Bieber",
      image: "assets/justin.png",
    ),
    Song(
      title: "Backburner",
      artist: "NIKI",
      image: "assets/Nicole_(Album)_cover.png",
    ),
    Song(
      title: "Paths",
      artist: "NIKI",
      image: "assets/nikiz.jpeg",
    ),
    Song(
      title: "Baby",
      artist: "Justin Bieber",
      image: "assets/justin.png",
    ),
    Song(
      title: "Grenade",
      artist: "Bruno Mars",
      image: "assets/bruno.png",
    ),
  ];
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECECCF),

      body: SafeArea(
        child: Column(
          children: [

            // Back Button
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const JenisPlaylist()));
                },
              ),
            ),

            const SizedBox(height: 10),

            // Header
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.bookmark_border,
                    color: Color(0xFFAA5A5A),
                  ),
                  const SizedBox(width: 10),

                  const Expanded(
                    child: Text(
                      "LIKED SONGS",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 15,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 18,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // List Lagu
            Expanded(
              child: ListView.builder(
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFB05A5A),
                          Color(0xFFE5D3C5),
                        ],
                      ),
                      border: Border.all(
                        color: Colors.black26,
                      ),
                    ),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          songs[index].image,
                          width: 45,
                          height: 45,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        songs[index].title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        songs[index].artist,
                        style: const TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.remove_circle,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            songs.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),

            const Icon(
              Icons.keyboard_double_arrow_down,
              size: 30,
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),

      // Bottom Navigatio

bottomNavigationBar: Container(
  margin: const EdgeInsets.all(16),
  padding: const EdgeInsets.symmetric(
    horizontal: 25,
    vertical: 8,
  ),
  decoration: BoxDecoration(
    color: Colors.grey.shade200,
    border: Border.all(
      color: Colors.black,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(20),
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      // HOME
      AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.all(
          selectedIndex == 0 ? 8 : 2,
        ),
        decoration: BoxDecoration(
          color: selectedIndex == 0
              ? Colors.black12
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: IconButton(
          onPressed: () {
            setState(() => selectedIndex = 0);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AlbumPage(),
              ),
            );
          },
          icon: const Icon(
            Icons.home_outlined,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      // PLAYLIST ACTIVE
      AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutBack,
        padding: EdgeInsets.all(
          selectedIndex == 1 ? 9 : 3,
        ),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 148, 52, 45),
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: IconButton(
          onPressed: () {
            setState(() => selectedIndex = 1);
          },
          icon: const Icon(
            Icons.group_add_outlined,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      // MUSIC
      AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.all(
          selectedIndex == 2 ? 8 : 2,
        ),
        decoration: BoxDecoration(
          color: selectedIndex == 2
              ? Colors.black12
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: IconButton(
          onPressed: () {
            setState(() => selectedIndex = 2);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const Playsong(),
              ),
            );
          },
          icon: const Icon(
            Icons.music_note_outlined,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      // PROFILE
      AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.all(
          selectedIndex == 3 ? 8 : 2,
        ),
        decoration: BoxDecoration(
          color: selectedIndex == 3
              ? Colors.black12
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: IconButton(
          onPressed: () {
            setState(() => selectedIndex = 3);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ProfilePage(),
              ),
            );
          },
          icon: const Icon(
            Icons.account_circle_outlined,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
    ],
  ),

      ),
    );
  }
}