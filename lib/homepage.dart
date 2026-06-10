import 'package:flutter/material.dart';
import 'package:flutter_application_2/playsong.dart';
import 'package:flutter_application_2/akun.dart';
import 'package:flutter_application_2/profileartist.dart';
import 'package:flutter_application_2/top3.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEE0),

      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFEE0),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'REKOMENDASI ALBUM',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),

            // SEARCH BAR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 45,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 250, 250),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.black54),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // LIST ALBUM
            Column(
              children: [
                albumItem("NIKI", 'assets/Nicole_(Album)_cover.png'),
                albumItem("KESHI", 'assets/keshi.png'),
                albumItem("BOYNEXTDOOR", 'assets/boynextdoor2.jpeg'),
                albumItem("TREASURE", 'assets/treasure2.jpeg'),
                albumItem("TAYLOR SWIFT", 'assets/taylorswift.jpg'),
                albumItem("LONGSHOT", 'assets/lngshot.jpeg'),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),

      // NAVBAR
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // HOME
            navItem(Icons.home_outlined, 0, () {}),

            // GROUP
            navItem(Icons.group_add_outlined, 1, () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => TopArtPage()));
            }),

            // MUSIC
            navItem(Icons.music_note_outlined, 2, () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const Playsong()));
            }),

            // PROFILE
            navItem(Icons.account_circle_outlined, 3, () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ProfilePage()));
            }),
          ],
        ),
      ),
    );
  }

  // NAV ITEM (biar rapi)
  Widget navItem(IconData icon, int index, VoidCallback onTap) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: EdgeInsets.all(selectedIndex == index ? 8 : 3),
      decoration: BoxDecoration(
        color: selectedIndex == index
            ? const Color.fromARGB(255, 148, 52, 45)
            : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {
          setState(() => selectedIndex = index);
          onTap();
        },
        icon: Icon(icon, size: 20, color: Colors.black),
      ),
    );
  }

  // ⭐ DESIGN BARU ALBUM
  Widget albumItem(String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const ProfileArtist(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                width: 65,
                height: 65,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 15),

            // TEXT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Popular Album",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            // PLAY BUTTON
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
