import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:movie_app/src/presentation/widgets/home/home.dart';
import 'package:movie_app/src/presentation/widgets/home/now_playing.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int index = 0;
    List<Widget> widgets = [
      const Home(),
      NowPlaying(),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
          child: SafeArea(
              child: Column(
            children: widgets,
          )),
        ),
      ),
      backgroundColor: Colors.white10,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: GNav(
          selectedIndex: index,
          onTabChange: (value) => setState(() {
            index = value;
          }),
          activeColor: Colors.white,
          color: Colors.grey.shade600,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          rippleColor: Colors.grey.withOpacity(0.5),
          tabBackgroundColor: Colors.white10,
          tabBackgroundGradient:
              const LinearGradient(colors: [Colors.white10, Colors.white30]),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          gap: 5,
          tabs: const [
            GButton(
              icon: LineIcons.home,
              text: 'Inicio',
            ),
            GButton(
              icon: LineIcons.heart,
              text: 'Favoritos',
            ),
            GButton(
              icon: LineIcons.search,
              text: 'Pesquisar',
            ),
          ],
        ),
      ),
    );
  }
}
