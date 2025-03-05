// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/spacer.dart';
import '../../../../core/utils/texts.dart';
import '../../../../widgets/place_card.dart';
import '../../../../widgets/roundedContainer.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Stack(
          children: [
            TabBarView(children: [
              MapView(),
              CatalogueView(),
            ]),
            CustomTabBar(),
          ],
        ),
      ),
    );
  }
}

class CatalogueView extends StatefulWidget {
  const CatalogueView({
    super.key,
  });

  @override
  State<CatalogueView> createState() => _CatalogueViewState();
}

class _CatalogueViewState extends State<CatalogueView> {
  String selectedFilter = '';
  @override
  Widget build(BuildContext context) {
    const filterList = ['All', 'Food and Beverages', 'Tourism', 'Recreation'];

    return SafeArea(
      child: ListView(
        children: [
          verticalSpace(7.h),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: RoundedContainer(
              padding: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: mainShade,
                    child: Image.asset('assets/images/Logo 1.png'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Bogor Timur, Bogor',
                        style: extraSmallText(size: 8),
                      ),
                      verticalSpace(4),
                      Text(
                        'Cari tempat wisata...',
                        style: smallText(color: customBlack),
                      ),
                    ],
                  ),
                  RoundedContainer(
                    padding: 6,
                    useShadow: false,
                    useBorder: true,
                    child: Image.asset(
                      'assets/images/Settings-adjust.png',
                    ),
                  ),
                ],
              ),
            ),
          ),
          verticalSpace(10),
          SizedBox(
            width: 100.w,
            height: 30,
            // color: Colors.red,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: filterList.length,
              padding: const EdgeInsets.only(left: 20),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFilter = filterList[index];
                    });
                    print(selectedFilter);
                  },
                  child: FilterItem(
                    text: filterList[index],
                    isSelected: selectedFilter == filterList[index],
                  ),
                );
              },
            ),
          ),
          ListView.builder(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            itemCount: 10,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: PlaceCard(),
              );
            },
          ),
          verticalSpace(10.h),
        ],
      ),
    );
  }
}

class FilterItem extends StatelessWidget {
  const FilterItem({
    super.key,
    required this.text,
    required this.isSelected,
  });

  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.grey[300]!, width: isSelected ? 0 : 1),
              color: isSelected ? customBlack : Colors.transparent,
              borderRadius: BorderRadius.circular(40)),
          child: Center(
              child: Text(
            text,
            style: TextStyle(color: isSelected ? Colors.white : Colors.grey),
          ))),
    );
  }
}

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.fromLTRB(20, 16, 20, 20),
        height: 6.h,
        decoration: BoxDecoration(
            color: const Color(0xffEEF5FF),
            border: Border.all(color: Colors.blueGrey[200]!),
            borderRadius: BorderRadius.circular(50)),
        child: TabBar(
            indicatorPadding: const EdgeInsets.all(3),
            labelPadding: const EdgeInsets.only(top: 2),
            unselectedLabelStyle: TextStyle(
                color: Colors.grey[500]!, fontWeight: FontWeight.w300),
            indicator: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(50)),
            tabs: const [
              Tab(
                child: Text(
                  'Tampilan Map',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Tab(
                child: Text(
                  'Tampilan Daftar',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ]),
      ),
    );
  }
}

class MapView extends StatelessWidget {
  const MapView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          options: const MapOptions(
              initialCenter: LatLng(-6.597629, 106.799568), initialZoom: 15),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            )
          ],
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                verticalSpace(7.h),
                RoundedContainer(
                  padding: 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: mainShade,
                        child: Image.asset('assets/images/Logo 1.png'),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Bogor Timur, Bogor',
                            style: extraSmallText(size: 8),
                          ),
                          verticalSpace(4),
                          Text(
                            'Cari tempat wisata...',
                            style: smallText(color: customBlack),
                          ),
                        ],
                      ),
                      RoundedContainer(
                        padding: 6,
                        useShadow: false,
                        useBorder: true,
                        child: Image.asset(
                          'assets/images/Settings-adjust.png',
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: mainColor,
                        child: Image.asset(
                          'assets/images/Target.png',
                          color: Colors.white,
                        ),
                      ),
                    ),
                    verticalSpace(12),
                    Stack(
                      children: [
                        const PlaceCard(),
                        Positioned(
                          bottom: 12,
                          right: 15,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Icon(
                                Icons.star_rate_rounded,
                                color: mainColor,
                                size: 25,
                              ),
                              Text(
                                '4.6',
                                style: largeText(size: 18, color: customBlack),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    verticalSpace(5.h),
                    ElevatedButton.icon(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              isDismissible: true,
                              builder: (context) {
                                return Container(
                                  height: 90.h,
                                  color: Colors.white,
                                  child: ListView(
                                    children: [
                                      verticalSpace(10),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: const CircleAvatar(
                                              backgroundColor: Colors.red,
                                              child: Icon(
                                                Icons.close,
                                                color: Colors.white,
                                              ),
                                            )),
                                      ),
                                      ListView.builder(
                                        itemCount: 15,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return ListTile(
                                            leading: Image.network(
                                              'https://cdn.pixabay.com/photo/2016/11/29/12/54/cafe-1869656_1280.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                            title:
                                                Text('SugarBites ${index + 1}'),
                                            subtitle: const Text('From 50k'),
                                            trailing: Text(
                                              '4.6',
                                              style: largeText(
                                                  size: 18, color: customBlack),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        icon: const Icon(Icons.menu),
                        label: const Text('List'))
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
