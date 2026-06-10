import 'package:flutter/material.dart';
import 'package:flutter_application_2/akun.dart';
import 'package:flutter_application_2/homepage.dart';
import 'package:flutter_application_2/likedsong.dart';
import 'package:flutter_application_2/playlist.dart';
import 'package:flutter_application_2/top3.dart';
import 'playsong.dart';

class JenisPlaylist extends StatefulWidget {
  const JenisPlaylist({super.key});

  @override
  State<JenisPlaylist> createState() => _JenisPlaylistState();
}

class _JenisPlaylistState extends State<JenisPlaylist> {
  int selectedIndex = 1;
  int selectedButton = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEE0),

      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFEE0),
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 80,

        title: const Padding(
          padding: EdgeInsets.only(top: 15),
          child: Text(
            "IT's SONG",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              width: 280,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
              ),

              child: const Center(
                child: Text(
                  "My Playlist",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedButton == 1
                        ? const Color.fromARGB(255, 148, 52, 45)
                        : const Color(0xFFFFFEE0),

                    foregroundColor: selectedButton == 1
                        ? Colors.white
                        : Colors.black,

                    side: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),

                  onPressed: () {
                    setState(() {
                      selectedButton = 1;
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const TopArtPage(),
                      ),
                    );
                  },

                  child: const Text("IT's Artist"),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedButton == 0
                        ? const Color.fromARGB(255, 148, 52, 45)
                        : const Color(0xFFFFFEE0),

                    foregroundColor: selectedButton == 0
                        ? Colors.white
                        : Colors.black,

                    side: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),

                  onPressed: () {
                    setState(() {
                      selectedButton = 0;
                    });
                  },

                  child: const Text("IT's Playlist"),
                ),
              ],
            ),

            const SizedBox(height: 30),

            GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => LikedSongsPage() // ganti ke halaman tujuan
      )
    );
  },

  child: Container(
    margin: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 10,
    ),

    padding: const EdgeInsets.symmetric(
      horizontal: 25,
      vertical: 15,
    ),

    decoration: BoxDecoration(
      color: const Color(0xFFFFFEE0),

      borderRadius: BorderRadius.circular(20),

      border: Border.all(
        color: Colors.black,
        width: 1,
      ),

      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 4,
          offset: Offset(2, 3),
        ),
      ],
    ),

    child: Row(
      children: const [
        Icon(
          Icons.favorite_border,
          size: 45,
          color: Color.fromARGB(255, 148, 52, 45),
        ),

        SizedBox(width: 30),

        Text(
          "Liked Song",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    ),
  ),
),

            playlistCard(
              context: context,
              image: 'assets/boynextdoor2.jpeg',
              title: 'buat galau',
              artis: 'Playlist By AntekAntekAsing',
              durasi: '30 menit - 170 songs',
            ),

            const SizedBox(height: 15),

            playlistCard(
              context: context,
              image: 'assets/boynextdoor2.jpeg',
              title: 'Night drive vibes',
              artis: 'Playlist By AntekAntekAsing',
              durasi: '15 menit - 80 songs',
            ),
            const SizedBox(height: 15),

            playlistCard(
              context: context, 
              image: 'assets/boynextdoor2.jpeg', 
              title: 'Buat nyuci piring', 
              artis: 'Playlist By HidupJokoOui', 
              durasi: '1 hour - 50 songs'
              ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 148, 52, 45),
        foregroundColor: Colors.white,

        onPressed: () {},

        child: const Icon(Icons.add),
      ),

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

Widget playlistCard({
  required BuildContext context,
  required String image,
  required String title,
  required String artis,
  required String durasi,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const IsiPlaylist(),
        ),
      );
    },

    child: Container(
      height: 120,
      width: double.infinity,
      padding: const EdgeInsets.all(10),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),

        border: Border.all(
          color: Colors.black,
          width: 1,
        ),

        gradient: const LinearGradient(
          colors: [
            Color(0xFF8A3E47),
            Color(0xFFB0897E),
          ],

          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),

      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),

            child: Image.asset(
              image,
              height: 100,
              width: 95,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 15),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                title,

                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                artis,

                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.only(left: 60),

                child: Text(
                  durasi,

                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}