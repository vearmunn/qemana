import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/spacer.dart';
import '../../../../core/utils/texts.dart';
import '../../../../widgets/roundedContainer.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                                  style:
                                      largeText(size: 18, color: customBlack),
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
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return ListTile(
                                              leading: Image.network(
                                                'https://cdn.pixabay.com/photo/2016/11/29/12/54/cafe-1869656_1280.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                              title: Text(
                                                  'SugarBites ${index + 1}'),
                                              subtitle: const Text('From 50k'),
                                              trailing: Text(
                                                '4.6',
                                                style: largeText(
                                                    size: 18,
                                                    color: customBlack),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
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
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  const PlaceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
        padding: 0,
        borderRadius: 20,
        child: Row(
          children: [
            SizedBox(
              // height: 130,
              width: 130,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    'https://cdn.pixabay.com/photo/2016/11/29/12/54/cafe-1869656_1280.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        RoundedContainer(
                            borderRadius: 10,
                            color: customLightGreen,
                            padding: 6,
                            child: Text(
                              'OPEN',
                              style: smallText(
                                  color: Colors.green[600],
                                  size: 10,
                                  weight: FontWeight.bold),
                            )),
                        horizontalSpace(4),
                        const VerticalDivider(
                          indent: 4,
                          endIndent: 4,
                        ),
                        horizontalSpace(4),
                        Text(
                          '09 AM - 08 PM',
                          style: extraSmallText(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(8),
                  SizedBox(
                    width: 100.w - 210,
                    child: Text(
                      'Sugarbites Bake & Sweet',
                      style: smallText(
                          color: customBlack, weight: FontWeight.bold),
                    ),
                  ),
                  verticalSpace(20),
                  Row(
                    children: [
                      Image.asset('assets/images/money.png'),
                      horizontalSpace(8),
                      Text(
                        'From 50k',
                        style: extraSmallText(),
                      )
                    ],
                  ),
                  verticalSpace(4),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/dish.png',
                        scale: 2,
                      ),
                      horizontalSpace(6),
                      Text(
                        'Food & Beverage',
                        style: extraSmallText(),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
