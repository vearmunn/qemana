import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/spacer.dart';
import '../../utils/texts.dart';
import '../../widgets/place_item.dart';
import '../../widgets/roundedContainer.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: backGroundColor,
        appBar: AppBar(
          backgroundColor: backGroundColor,
          elevation: 0,
          toolbarHeight: 100,
          title: RoundedContainer(
            padding: 8,
            child: Row(
              children: [
                horizontalSpace(6),
                CircleAvatar(
                  backgroundColor: mainShade,
                  child: Image.asset('assets/images/Logo 1.png'),
                ),
                horizontalSpace(16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bogor Timur, Bogor',
                      style: extraSmallText(size: 8),
                    ),
                    verticalSpace(4),
                    Text(
                      'Mau Qemana hari ini...',
                      style: smallText(color: customBlack),
                    ),
                  ],
                ),
                Expanded(child: horizontalSpace(0)),
                RoundedContainer(
                  padding: 6,
                  useShadow: false,
                  useBorder: true,
                  child: Image.asset(
                    'assets/images/Settings-adjust.png',
                  ),
                ),
                horizontalSpace(6),
              ],
            ),
          ),
          bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: mainColor,
              tabs: [
                Tab(
                  icon: Image.asset('assets/images/dish-02.png'),
                  child: Text(
                    'Food & Beverages',
                    textAlign: TextAlign.center,
                    style: extraSmallText(
                        color: customBlack, weight: FontWeight.bold),
                  ),
                ),
                Tab(
                  icon: Image.asset('assets/images/island.png'),
                  child: Text(
                    'Holiday & Tourism',
                    textAlign: TextAlign.center,
                    style: extraSmallText(
                        color: customBlack, weight: FontWeight.bold),
                  ),
                ),
                Tab(
                  icon: Image.asset('assets/images/calendar-favorite.png'),
                  child: Text(
                    'Events & Exhiibit',
                    textAlign: TextAlign.center,
                    style: extraSmallText(
                        color: customBlack, weight: FontWeight.bold),
                  ),
                ),
                Tab(
                  icon: Image.asset('assets/images/train.png'),
                  child: Text(
                    'Public Services',
                    textAlign: TextAlign.center,
                    style: extraSmallText(
                        color: customBlack, weight: FontWeight.bold),
                  ),
                ),
              ]),
        ),
        body: const TabBarView(children: [
          TabFnB(),
          Center(
            child: Text('Holiday & Tourism'),
          ),
          Center(
            child: Text('Events & Exhiibit'),
          ),
          Center(
            child: Text('Public Services'),
          ),
        ]),
      ),
    );
  }
}

class TabFnB extends StatelessWidget {
  const TabFnB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      children: [
        verticalSpace(15),
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  Container(
                      margin: const EdgeInsets.only(right: 15),
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network(
                          'https://cdn.pixabay.com/photo/2016/11/29/12/54/cafe-1869656_1280.jpg',
                          fit: BoxFit.cover,
                        ),
                      )),
                  Container(
                    margin: const EdgeInsets.only(right: 15),
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.black54,
                    ),
                  ),
                  const Positioned(
                    right: 25,
                    top: 15,
                    child: RoundedContainer(
                        padding: 15,
                        color: Colors.black45,
                        child: Icon(
                          Icons.location_on_outlined,
                          color: Colors.white,
                        )),
                  ),
                  Positioned(
                      left: 25,
                      bottom: 15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Restaurants',
                            style: largeText(color: Colors.white, size: 22),
                          ),
                          Text(
                            '134 locations near you',
                            style: extraSmallText(color: Colors.white),
                          ),
                        ],
                      )),
                ],
              );
            },
          ),
        ),
        verticalSpace(30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trending Restaurants',
                style: largeText(size: 18),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Browse More',
                    style: TextStyle(color: customPurple),
                  ))
            ],
          ),
        ),
        verticalSpace(8),
        ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: 3,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return const PlaceItem();
          },
        ),
      ],
    );
  }
}
