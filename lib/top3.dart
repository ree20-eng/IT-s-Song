import 'package:flutter/material.dart';
import 'package:flutter_application_2/akun.dart';
import 'package:flutter_application_2/daftarplaylist.dart';
import 'package:flutter_application_2/homepage.dart';

import 'playsong.dart';

class TopArtPage extends StatefulWidget {
  const TopArtPage({super.key});

  @override
  State<TopArtPage> createState() => _TopArtPageState();
}

class _TopArtPageState extends State<TopArtPage> {
  int selectedIndex = 1;
  int selectedButton = 0;
  final Color bgCard = const Color(0xFF8A3E47);
  final Color bgCard2 = const Color(0xFFB0897E);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
              const SizedBox(height: 10),

              // 🔥 Kotak judul TOP 3 ARTIST
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
                    "TOP 3 ARTIST",
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
                      backgroundColor: selectedButton == 0 ? Color.fromARGB(255, 148, 52, 45) : const Color(0xFFFFFEE0),
                      foregroundColor: selectedButton == 0 ? Colors.white : Colors.black,
                      side: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      )
                    ),
                    onPressed: () {
                      setState(() {
                        selectedButton = 0;
                      });
                    }, child: const Text("IT's Artist"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:selectedButton == 1 ? Color.fromARGB(255, 148, 52, 45) : const Color(0xFFFFFEE0),
                      foregroundColor: selectedButton == 1 ? Colors.white : Colors.black,
                      side: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      )
                    ),
                    onPressed: () {
                      setState(() {
                        selectedButton = 1;
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (_) => JenisPlaylist()));
                  }, child: const Text("IT's Playlist"))
                ],
              ),

              const SizedBox(height: 30),

              artistCard(
                image: 'assets/boynextdoor2.jpeg',
                title: 'BOYNEXTDOOR',
                song: 'Serenade',
              ),

              const SizedBox(height: 30),

              artistCard(
                image: 'assets/taylorswift.jpg',
                title: 'Taylor Swift',
                song: 'Blank Space',
              ),

              const SizedBox(height: 30),

              artistCard(
                image: 'assets/treasure2.jpeg',
                title: 'TREASURE',
                song: 'Better Than Me',
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),

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
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: EdgeInsets.all(selectedIndex == 0 ? 8 : 2),
                decoration: BoxDecoration(
                  color:
                      selectedIndex == 0 ? Colors.black12 : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() => selectedIndex = 0);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => AlbumPage()),
                    );
                  },
                  icon: const Icon(Icons.home_outlined,
                      size: 20, color: Colors.black),
                ),
              ),

              // TOP 3 ART
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: EdgeInsets.all(selectedIndex == 1 ? 9 : 3),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 148, 52, 45),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() => selectedIndex = 1);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const TopArtPage()),
                    );
                  },
                  icon: const Icon(Icons.group_add_outlined,
                      size: 20, color: Colors.black),
                ),
              ),

              // MUSIC
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutBack,
                padding: EdgeInsets.all(selectedIndex == 2 ? 8 : 2),
                decoration: BoxDecoration(
                  color: selectedIndex == 2 ? Colors.black12 : Colors.transparent,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() => selectedIndex = 2);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Playsong()),
                    );
                  },
                  icon: const Icon(Icons.music_note_outlined,
                      size: 20, color: Colors.black),
                ),
              ),

              // PROFILE
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: EdgeInsets.all(selectedIndex == 3 ? 8 : 2),
                decoration: BoxDecoration(
                  color:
                      selectedIndex == 3 ? Colors.black12 : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() => selectedIndex = 3);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ProfilePage()),
                    );
                  },
                  icon: const Icon(Icons.account_circle_outlined,
                      size: 20, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget artistCard({
    required String image,
    required String title,
    required String song,
  }) {
    return Container(
      height: 115,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          colors: [bgCard, bgCard2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
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
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Icons.music_note, size: 18, color: Colors.white),
                  const SizedBox(width: 5),
                  Text(
                    song,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 13),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
