import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  List<Widget> pages = [
    Container(
      color: Colors.amber,
    ),
    Container(
      color: Colors.blue,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
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
              LinearGradient(colors: [Colors.white10, Colors.white30]),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          gap: 5,
          tabs: [
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
