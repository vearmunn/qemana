import 'package:flutter/material.dart';
import 'package:qemana/pages/main_menu/map_page.dart';

import '../../utils/colors.dart';
import '../../utils/spacer.dart';
import '../../utils/texts.dart';
import 'explore.dart';
import 'home.dart';
import 'tripboard.dart';

class PrimaryPage extends StatefulWidget {
  const PrimaryPage({super.key});

  @override
  State<PrimaryPage> createState() => _PrimaryPageState();
}

class _PrimaryPageState extends State<PrimaryPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    const screens = [
      HomePage(),
      ExplorePage(),
      TripboardPage(),
      Center(
        child: Text('Profile'),
      ),
    ];
    return Scaffold(
      body: screens[selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const MapPage()));
        },
        backgroundColor: mainColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.map_outlined),
            Text(
              'Map',
              style: extraSmallText(color: Colors.white),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: MediaQuery.of(context).size.height * 0.1,
        notchMargin: 8,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        shape: const CircularNotchedRectangle(),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            bottomNavbarItem(
              imgUrl: 'home',
              text: 'Home',
              index: 0,
            ),
            bottomNavbarItem(
              imgUrl: 'search',
              text: 'Search',
              index: 1,
            ),
            bottomNavbarItem(
              imgUrl: 'tripboard',
              text: 'Tripboard',
              index: 2,
            ),
            bottomNavbarItem(
              imgUrl: 'user',
              text: 'Profile',
              index: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomNavbarItem(
      {required int index, required String imgUrl, required String text}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/$imgUrl.png',
              color: selectedIndex == index ? customBlack : Colors.grey,
            ),
            verticalSpace(8),
            Text(
              text,
              style: extraSmallText(
                  color: selectedIndex == index ? customBlack : Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
