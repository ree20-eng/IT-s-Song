import 'package:flutter/material.dart';
import 'package:flutter_application_2/homepage.dart';
import 'package:flutter_application_2/top3.dart';
import 'package:flutter_application_2/playsong.dart';
import 'package:flutter_application_2/welcome_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFFFFEE0),

        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                const Icon(
                  Icons.account_circle_outlined,
                  size: 100,
                  color: Colors.black87,
                ),
                const SizedBox(height: 10),
                const Text(
                  'kumar hdyt al-yoshi',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 40),

                // Judul Akun
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Akun',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                _buildGradientCard(
                  items: const [
                    _ProfileItem(icon: Icons.email_outlined, label: 'E-mail'),
                  ],
                ),

                const SizedBox(height: 25),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Lainnya',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                _buildGradientCard(
                  items: const [
                    _ProfileItem(icon: Icons.language, label: 'Bahasa'),
                    _ProfileItem(icon: Icons.logout, label: 'Log Out'),
                  ],
                ),
              ],
            ),
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
                  color: selectedIndex == 0 ? Colors.black12 : Colors.transparent,
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
                padding: EdgeInsets.all(selectedIndex == 2 ? 8 : 2),
                decoration: BoxDecoration(
                  color: selectedIndex == 2 ? Colors.black12 : Colors.transparent,
                  borderRadius: BorderRadius.circular(12)
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
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutBack,
                padding: EdgeInsets.all(selectedIndex == 3 ? 9 : 3),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 148, 52, 45),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() => selectedIndex = 3);
             
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

  Widget _buildGradientCard({required List<_ProfileItem> items}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFB3544F),
          Color(0xFFB3544F),
          Color(0xFFB59B91),
        ],
      ),
    ),
    child: Column(
      children: [
        for (int i = 0; i < items.length; i++) ...[
          ListTile(
            leading: Icon(items[i].icon, color: Colors.black),
            title: Text(
              items[i].label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            onTap: () {
              if (items[i].label == 'Log Out') {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const WelcomeScreen(),
                  ),
                  (route) => false,
                );
              }
            },
          ),

          if (i != items.length - 1)
            const Divider(
              color: Colors.black38,
              height: 1,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
        ],
      ],
    ),
  );
}
}

class _ProfileItem {
  final IconData icon;
  final String label;
  const _ProfileItem({required this.icon, required this.label});
}
