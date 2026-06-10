import 'package:flutter/material.dart';
import 'playlist.dart';

class KumpulanLagu extends StatelessWidget {
  const KumpulanLagu({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Song> daftarLagu = [
      Song(title: "Better Than Me", artist: "TREASURE"),
      Song(title: "Did You Like Her In The Morning", artist: "NIKI"),
      Song(title: "Backburner", artist: "NIKI"),
      Song(title: "The Apartment We Won't Share", artist: "NIKI"),
      Song(title: "Blue", artist: "Yung Kai"),
      Song(title: "Dandelions", artist: "Ruth B"),
      Song(title: "Snooze", artist: "SZA"),
      Song(title: "Glimpse Of Us", artist: "Joji"),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFFFEE0),

      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFEE0),
        centerTitle: true,
        title: const Text(
          "Kumpulan Lagu",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: ListView.builder(
        itemCount: daftarLagu.length,
        itemBuilder: (context, index) {

          final song = daftarLagu[index];

          return Card(
            color: const Color(0xFFFFFEE0),
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),

            child: ListTile(
              leading: const Icon(
                Icons.music_note,
                color: Color.fromARGB(255, 134, 21, 21),
              ),

              title: Text(song.title),
              subtitle: Text(song.artist),

              trailing: IconButton(
                icon: const Icon(
                  Icons.add_circle,
                  color: Color.fromARGB(255, 134, 21, 21),
                ),

                onPressed: () {
                  // 🔥 kirim lagu ke playlist
                  Navigator.pop(context, song);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}