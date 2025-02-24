import 'package:flutter/material.dart';
import 'package:qemana/features/main_menu/presentation/pages/map_page.dart';
import 'package:qemana/features/profile/profile_page.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/spacer.dart';
import '../../../../core/utils/texts.dart';
import 'explore.dart';
import 'home_v2.dart';
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
      MapPage(),
      TripboardPage(),
      ProfilePage(),
    ];
    return Scaffold(
      body: Stack(
        children: [
          screens[selectedIndex],
          Positioned(
            bottom: 0,
            child: Container(
              width: 100.w - 32,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.all(24),
              margin: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  bottomNavbarItem(
                    imgUrl: 'home-04',
                    text: 'Home',
                    index: 0,
                  ),
                  bottomNavbarItem(
                    imgUrl: 'favourite',
                    text: 'Activity',
                    index: 1,
                  ),
                  bottomNavbarItem(
                    imgUrl: 'maps',
                    text: 'Explore',
                    index: 2,
                  ),
                  bottomNavbarItem(
                    imgUrl: 'dashboard-square-add',
                    text: 'Tripboard',
                    index: 3,
                  ),
                  bottomNavbarItem(
                    imgUrl: 'user',
                    text: 'Profile',
                    index: 4,
                  ),
                ],
              ),
            ),
          )
        ],
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
            selectedIndex == index
                ? Image.asset(
                    'assets/images/$imgUrl.png',
                  )
                : Image.asset(
                    'assets/images/$imgUrl.png',
                    color: Colors.grey[900],
                  ),
            verticalSpace(8),
            Text(
              text,
              style: extraSmallText(
                  color:
                      selectedIndex == index ? Colors.white : Colors.grey[800]),
            )
          ],
        ),
      ),
    );
  }
}
