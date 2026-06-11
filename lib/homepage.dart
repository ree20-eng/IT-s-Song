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

            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 45,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.search, color: Colors.black54),
                    SizedBox(width: 10),
                    Expanded(
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
            navItem(Icons.home_outlined, 0, () {}),
            navItem(Icons.group_add_outlined, 1, () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => TopArtPage()));
            }),
            navItem(Icons.music_note_outlined, 2, () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const Playsong()));
            }),
            navItem(Icons.account_circle_outlined, 3, () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ProfilePage()));
            }),
          ],
        ),
      ),
    );
  }

  // NAV ITEM
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

 
  Widget albumItem(String title, String imagePath) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.95, end: 1),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      builder: (context, double scale, child) {
        return Transform.scale(
          scale: scale,
          child: child,
        );
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 400),
              pageBuilder: (_, __, ___) => const ProfileArtist(),
              transitionsBuilder: (_, animation, __, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              // IMAGE
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imagePath,
                    width: 65,
                    height: 65,
                    fit: BoxFit.cover,
                  ),
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
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Top Hits • 2026",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.all(10),
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
      ),
    );
  }
}
