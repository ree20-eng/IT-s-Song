import 'package:flutter/material.dart';
import 'package:flutter_application_2/akun.dart';
import 'package:flutter_application_2/homepage.dart';
import 'package:flutter_application_2/playsong.dart';
import 'package:flutter_application_2/top3.dart';

class ProfileArtist extends StatefulWidget {
  const ProfileArtist({super.key});

  @override
  State<ProfileArtist> createState() => _ProfileArtist();
}

class _ProfileArtist extends State<ProfileArtist> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEE0),

      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFEE0),
        centerTitle: true,
        toolbarHeight: 45,
        title: const Padding(
          padding: EdgeInsets.only(top: 15),
          child: Text(
            'REKOMENDASI ALBUM',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AlbumPage(),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_left,
            size: 50,
            color: Colors.black,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 35),

            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      spreadRadius: 4,
                      blurRadius: 5,
                      offset: const Offset(3, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(1),
                  child: Image.asset(
                    'assets/Nicole_(Album)_cover.png',
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Center(
              child: Text(
                "Hello, this is NIKI.\nLooks like you’ve been listening to my songs a lot lately, 143 times this month to be exact.\nHere are your top NIKI tracks, just for you. Enjoy 💛",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const SizedBox(height: 20),

            songItem(
              number: '1',
              title: 'Did You Like Her In The Morning?',
              album: 'Buzz - Album',
              image: 'assets/nikiz.jpeg',
            ),

            const SizedBox(height: 20),

            songItem(
              number: '2',
              title: "The Apartment We Won't Share",
              album: 'Nicole - Album',
              image: 'assets/Nicole_(Album)_cover.png',
            ),

            const SizedBox(height: 20),

            songItem(
              number: '3',
              title: 'Backburner',
              album: 'Nicole - Album',
              image: 'assets/Nicole_(Album)_cover.png',
            ),

            const SizedBox(height: 20),

            songItem(
              number: '4',
              title: 'Paths',
              album: 'Buzz - Album',
              image: 'assets/nikiz.jpeg',
            ),
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
  padding: EdgeInsets.all(selectedIndex == 0 ? 9 : 3),
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
      setState(() => selectedIndex = 0);
    },
    icon: const Icon(
      Icons.home_outlined,
      size: 20,
      color: Colors.black,
    ),
  ),
),

      // GROUP
      AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.all(selectedIndex == 1 ? 8 : 2),
        decoration: BoxDecoration(
          color: selectedIndex == 1
              ? Colors.black12
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: IconButton(
          onPressed: () {
            setState(() => selectedIndex = 1);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const TopArtPage(),
              ),
            );
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
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutBack,
        padding: EdgeInsets.all(selectedIndex == 2 ? 8 : 2),
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
        padding: EdgeInsets.all(selectedIndex == 3 ? 8 : 2),
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

Widget songItem({
  required String number,
  required String title,
  required String album,
  required String image,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(width: 15),

        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            image,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(width: 15),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(album),
            ],
          ),
        ),
      ],
    ),
  );
}