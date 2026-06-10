import 'package:flutter/material.dart';
import 'package:flutter_application_2/daftarplaylist.dart';
import 'package:flutter_application_2/kumpulan_lagu.dart';
import 'package:flutter_application_2/top3.dart';
import 'package:flutter_application_2/homepage.dart';
import 'package:flutter_application_2/akun.dart';
import 'package:flutter_application_2/playsong.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Song {
  int? id;
  String title;
  String artist;

  Song({
    this.id,
    required this.title,
    required this.artist,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "artist": artist,
    };
  }

  factory Song.fromMap(Map<String, dynamic> map) {
    return Song(
      id: map["id"],
      title: map["title"],
      artist: map["artist"],
    );
  }
}

class DBHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;

    String path = join(
      await getDatabasesPath(),
      "playlist.db",
    );

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE songs(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            artist TEXT
          )
        ''');
      },
    );

    return _database!;
  }

  static Future<void> insertSong(
    Song song,
  ) async {
    final db = await database;
    await db.insert("songs", song.toMap());
  }

  static Future<List<Song>> getSongs() async {
    final db = await database;

    final result = await db.query("songs");

    return result.map((e) => Song.fromMap(e)).toList();
  }

  static Future<void> deleteSong(
    int id,
  ) async {
    final db = await database;

    await db.delete(
      "songs",
      where: "id=?",
      whereArgs: [id],
    );
  }

  static Future<void> updateSong(
    Song song,
  ) async {
    final db = await database;

    await db.update(
      "songs",
      song.toMap(),
      where: "id=?",
      whereArgs: [song.id],
    );
  }
}

class IsiPlaylist extends StatefulWidget {
  const IsiPlaylist({super.key});

  @override
  State<IsiPlaylist> createState() => _IsiPlaylistState();
}

class _IsiPlaylistState extends State<IsiPlaylist> {
  int selectedIndex = 1;

  List<Song> songs = [];

  @override
  void initState() {
    super.initState();
    loadSongs();
  }

  Future<void> loadSongs() async {
    songs = await DBHelper.getSongs();

    setState(() {});
  }

  void editSongDialog(Song song) {
    TextEditingController titleCtrl = TextEditingController(text: song.title);

    TextEditingController artistCtrl = TextEditingController(text: song.artist);

    showDialog(
      context: this.context,
      builder: (_) => AlertDialog(
        title: const Text("Edit Lagu"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleCtrl,
              decoration: const InputDecoration(
                labelText: "Judul Lagu",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: artistCtrl,
              decoration: const InputDecoration(
                labelText: "Artist",
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(this.context);
            },
            child: const Text("Batal"),
          ),
          ElevatedButton(
            onPressed: () async {
              await DBHelper.updateSong(
                Song(
                  id: song.id,
                  title: titleCtrl.text,
                  artist: artistCtrl.text,
                ),
              );

              Navigator.pop(this.context);

              loadSongs();
            },
            child: const Text("Simpan"),
          ),
        ],
      ),
    );
  }

  void addSongDialog() {
    TextEditingController titleCtrl = TextEditingController();

    TextEditingController artistCtrl = TextEditingController();

    showModalBottomSheet(
      context: this.context,
      isScrollControlled: true,
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(this.context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Tambah Lagu",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: titleCtrl,
                decoration: const InputDecoration(
                  labelText: "Judul Lagu",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: artistCtrl,
                decoration: const InputDecoration(
                  labelText: "Artist",
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (titleCtrl.text.isEmpty || artistCtrl.text.isEmpty) {
                    return;
                  }

                  await DBHelper.insertSong(
                    Song(
                      title: titleCtrl.text,
                      artist: artistCtrl.text,
                    ),
                  );

                  Navigator.pop(this.context);

                  loadSongs();
                },
                child: const Text("Tambah"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ITSong',
      home: Scaffold(
        backgroundColor: const Color(0xFFFFFEE0),
        appBar: AppBar(
          backgroundColor: const Color(0xFFFFFEE0),
          toolbarHeight: 45,
          centerTitle: true,
          title: const Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              'buat galau',
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
                  builder: (_) => const JenisPlaylist(),
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
              const SizedBox(height: 15),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 4,
                        blurRadius: 5,
                        offset: const Offset(3, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1),
                    child: Image.asset(
                      'assets/boynextdoor2.jpeg',
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        size: 25,
                        color: Color.fromARGB(255, 134, 21, 21),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shuffle,
                        size: 25,
                        color: Color.fromARGB(255, 134, 21, 21),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Playsong(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.play_circle_fill,
                        size: 40,
                        color: Color.fromARGB(255, 134, 21, 21),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border_outlined,
                        size: 25,
                        color: Color.fromARGB(255, 134, 21, 21),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.download,
                        size: 25,
                        color: Color.fromARGB(255, 134, 21, 21),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color(0xFFFFFEE0),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.music_note,
                      ),
                      title: Text(
                        songs[index].title,
                      ),
                      subtitle: Text(
                        songs[index].artist,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.edit,
                              color: Color.fromARGB(255, 134, 21, 21),
                            ),
                            onPressed: () {
                              editSongDialog(
                                songs[index],
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.cancel_outlined,
                              color: Color.fromARGB(255, 134, 21, 21),
                            ),
                            onPressed: () async {
                              await DBHelper.deleteSong(
                                songs[index].id!,
                              );

                              loadSongs();
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(
            255,
            148,
            52,
            45,
          ),
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
          onPressed: () async {
            final Song? selectedSong = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const KumpulanLagu(),
              ),
            );

            if (selectedSong != null) {
              await DBHelper.insertSong(selectedSong);
              await loadSongs();

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("${selectedSong.title} ditambahkan"),
                ),
              );
            }
          },
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
                  color:
                      selectedIndex == 0 ? Colors.black12 : Colors.transparent,
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
                  color:
                      selectedIndex == 2 ? Colors.black12 : Colors.transparent,
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
                  color:
                      selectedIndex == 3 ? Colors.black12 : Colors.transparent,
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
      ),
    );
  }
}
