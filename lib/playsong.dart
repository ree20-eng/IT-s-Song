import 'dart:async'; //import timer 
import 'package:flutter/material.dart'; //import material dari google
import 'package:flutter_application_2/akun.dart';
import 'package:flutter_application_2/top3.dart';
import 'package:flutter_application_2/homepage.dart';

class Playsong extends StatefulWidget { 
  
  const Playsong({super.key});

  @override
  State<Playsong> createState() => _PlaysongState(); // untuk menyimpan data dan logika
}

class _PlaysongState extends State<Playsong> {
  bool isFavorite = false;
  bool isPlaying = false; // 
  double sliderValue = 0.0; // awalnya bernilai 0.0 karena lagu dimulai dari detik 0
  double songDuration = 176; //durasi akhir lagu agar timer tidak melewati durasi
  Timer? timer; // timer yang buat waktu berjalan. kenapa pake ? karena timer baru berjalan saat tombol play di klik

  // navbar index animation
  int selectedIndex = 2;

  String formatTime(double seconds) { // untuk mengubah format waktu dari detik ke menit
    int minutes = seconds ~/ 60;
    int secs = (seconds % 60).toInt();
    return '$minutes:${secs.toString().padLeft(2, '0')}';
  }

  void playSimulation() { // menyinkronkan slider dengan timer
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (sliderValue < songDuration) { //pake percabangan
        setState(() {
          sliderValue += 1;
        });
      } else {
        stopSimulation();
      }
    });
  }

  void stopSimulation() { // untuk stop timer
    timer?.cancel();
    setState(() {
      isPlaying = false; //isplaying kembali menjadi false setelah sebelumnya menjadi true
    });
  }

  @override
  void dispose() { 
    timer?.cancel(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ITsong',
      home: Scaffold(
        backgroundColor: const Color(0xFFFFFEE0),

        appBar: AppBar(
          backgroundColor: const Color(0xFFFFFEE0),
          toolbarHeight: 45, //mengatur tinggi appbar
          centerTitle: true,
          title: const Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              'LOVE PULSE',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => TopArtPage()));
            },
            icon: const Icon(Icons.arrow_left, size: 50, color: Colors.black),
          ),
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),

              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
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
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/love pulse.jpeg',
                      width: 290,
                      height: 280,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'BETTER THAN ME',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'TREASURE',
                          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() => isFavorite = !isFavorite);
                      },
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                        color: isFavorite ? Colors.red : Colors.black,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: const Color.fromARGB(255, 134, 21, 21),
                    inactiveTrackColor: Colors.black,
                    thumbColor: const Color.fromARGB(255, 134, 21, 21),
                    trackHeight: 2,
                  ),
                  child: Slider(
                    value: sliderValue,
                    min: 0,
                    max: songDuration,
                    onChanged: (val) {
                      setState(() => sliderValue = val);
                    },
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatTime(sliderValue)),
                    Text(formatTime(songDuration)),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.replay, size: 30)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.skip_previous, size: 30)),

                    IconButton(
                      iconSize: 50,
                      icon: Icon(isPlaying
                          ? Icons.stop_circle_outlined
                          : Icons.play_circle_fill_outlined),
                      onPressed: () {
                        setState(() {
                          if (isPlaying) {
                            stopSimulation();
                          } else {
                            isPlaying = true;
                            playSimulation();
                          }
                        });
                      },
                    ),

                    IconButton(onPressed: () {}, icon: const Icon(Icons.skip_next, size: 30)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.queue_music, size: 30)),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              Center(
                child: Container(
                  width: 300,
                  height: 250,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFEE0),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: 3),
                  ),
                  child: const Scrollbar(
                    thumbVisibility: true,
                    child: SingleChildScrollView(
                      child: Text(
                        """I'm still alone
Missing home
Every song I hear I'm thinking 'bout you
I'm getting on
But since you're gone
Ain't nobody left for me to turn to
You ran
Straight to
His arms
After crying on my shoulder
No matter what you say
He'll never take my place
Does he love you
And make you feel like a summer day
Does he touch you
And does he take all your pain away
He ain't better than me
Tell me why
You said goodbye
I never lied
I never cheated your heart
And now I find
You cheated mine
It exploded like a shot in the dark
You ran
Straight to
His arms
After crying on my shoulder
No matter what you say
He'll never take my place
Does he love you
And make you feel like a summer day
Does he touch you
And does he take all your pain away
And can he make you smile like magic
Jump through the fire and set you free
It's obvious to see
He ain't better than me
No
He ain't better than me
It's too much
When it's all up in my face
But I just can't fight
Don't wanna believe it
I'll never believe it
No
Wake me up
When we can live again live again right
Cause that's the only way it should be
That's the only way the only way
Does he love you
And make you feel like a summer day
Does he touch you
And does he take all your pain away
And can he make you smile like magic
Jump through the fire and set you free
It's obvious to see
He ain't better than me
That's why you gotta believe
He ain't better than me""",
                        style: TextStyle(fontWeight: FontWeight.w500, height: 1.4),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),

        // ✅ NAVBAR SUDAH ADA onPressed
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
                  color: selectedIndex == 0 ? const Color.fromARGB(31, 194, 27, 27) : const Color.fromARGB(0, 199, 29, 29),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() => selectedIndex = 0);
                    Navigator.push(
                      context, MaterialPageRoute(builder: (_) => AlbumPage()));
                  },
                  icon: const Icon(Icons.home_outlined, size: 20, color: Colors.black),
                ),
              ),

              // GROUP
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: EdgeInsets.all(selectedIndex == 1 ? 8 : 2),
                decoration: BoxDecoration(
                  color: selectedIndex == 1 ? Colors.black12 : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() => selectedIndex = 1);
                    Navigator.push(
                      context, MaterialPageRoute(builder: (_) => TopArtPage()));
                  },
                  icon: const Icon(Icons.group_add_outlined, size: 20, color: Colors.black),
                ),
              ),

              // MUSIC
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutBack,
                padding: EdgeInsets.all(selectedIndex == 2 ? 9 : 3),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 148, 52, 45),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() => selectedIndex = 2);
                    Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Playsong()));
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
                  color: selectedIndex == 3 ? Colors.black12 : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() => selectedIndex = 3);
                    Navigator.push(
                      context, MaterialPageRoute(builder: (_) => ProfilePage()));
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
}
