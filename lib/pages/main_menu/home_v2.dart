// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:qemana/utils/texts.dart';
import 'package:qemana/widgets/custom_textfield.dart';

import '../../utils/colors.dart';
import '../../utils/spacer.dart';
import '../../widgets/icon_with_label.dart';
import '../../widgets/place_item.dart';
import '../../widgets/roundedContainer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 100,
          title: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
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
                          style: extraSmallText(
                              size: 9,
                              color: customBlack,
                              weight: FontWeight.bold),
                        ),
                      ],
                    ),
                    horizontalSpace(8),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              Expanded(child: horizontalSpace(0)),
              Badge(
                label: const Text('2'),
                backgroundColor: navalBlue,
                offset: const Offset(0, 0),
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: RoundedContainer(
                    useBorder: true,
                    padding: 12,
                    child: Image.asset('assets/images/chat alt 3.png')),
              ),
              horizontalSpace(8),
              Badge(
                label: const Text('2'),
                backgroundColor: navalBlue,
                offset: const Offset(0, 0),
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: RoundedContainer(
                    useBorder: true,
                    padding: 12,
                    child: Image.asset('assets/images/notification bell.png')),
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            // SEARCH TEXTFIELD------------------------------------------------------------------------------------------
            CustomTextfield(
              hint: 'Mau qemana hari ini...',
              prefix: Image.asset(
                'assets/images/search.png',
                color: Colors.black,
              ),
              suffix: Image.asset(
                'assets/images/Settings-adjust.png',
                color: Colors.black,
              ),
              controller: TextEditingController(),
            ),
            verticalSpace(10),
            // BANNER--------------------------------------------------------------------------------------------------
            Container(
              margin: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: customBlack, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset('assets/images/Banners.png')),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconWithLabel(
                          label: 'Terdekat',
                          imagePath: 'maps location.png',
                          onTap: () {},
                        ),
                        IconWithLabel(
                          label: 'Trending',
                          imagePath: 'Fire.png',
                          onTap: () {},
                        ),
                        IconWithLabel(
                          label: 'Populer',
                          imagePath: 'stars.png',
                          onTap: () {},
                        ),
                        IconWithLabel(
                          label: 'Disimpan',
                          imagePath: 'download alt 5.png',
                          onTap: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            verticalSpace(20),
            // MENU----------------------------------------------------------------------------------------------------
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisSpacing: 1,
              mainAxisSpacing: 10,
              crossAxisCount: 4,
              children: [
                IconWithLabel(
                  borderColor: Colors.transparent,
                  bgColor: Colors.grey[300]!,
                  labelColor: Colors.black,
                  label: 'Restoran &\nCafe',
                  imagePath: 'dish-02.png',
                  onTap: () {},
                ),
                IconWithLabel(
                  borderColor: Colors.transparent,
                  bgColor: Colors.grey[300]!,
                  labelColor: Colors.black,
                  label: 'Pusat\nPerbelanjaan',
                  imagePath: 'bag alt.png',
                  onTap: () {},
                ),
                IconWithLabel(
                  borderColor: Colors.transparent,
                  bgColor: Colors.grey[300]!,
                  labelColor: Colors.black,
                  label: 'Monumen &\nBudaya',
                  imagePath: 'lighthouse.png',
                  onTap: () {},
                ),
                IconWithLabel(
                  borderColor: Colors.transparent,
                  bgColor: Colors.grey[300]!,
                  labelColor: Colors.black,
                  label: 'Taman &\nAlun-alun',
                  imagePath: 'forest-2.png',
                  onTap: () {},
                ),
                IconWithLabel(
                  borderColor: Colors.transparent,
                  bgColor: Colors.grey[300]!,
                  labelColor: Colors.black,
                  label: 'Jalur\nPendakian',
                  imagePath: 'direction sign.png',
                  onTap: () {},
                ),
                IconWithLabel(
                  borderColor: Colors.transparent,
                  bgColor: Colors.grey[300]!,
                  labelColor: Colors.black,
                  label: 'Pantai &\nWahana Air',
                  imagePath: 'jetski.png',
                  onTap: () {},
                ),
                IconWithLabel(
                  borderColor: Colors.transparent,
                  bgColor: Colors.grey[300]!,
                  labelColor: Colors.black,
                  label: 'Camp &\nAlam',
                  imagePath: 'camping.png',
                  onTap: () {},
                ),
                IconWithLabel(
                  borderColor: Colors.transparent,
                  bgColor: customBlack,
                  labelColor: Colors.black,
                  label: 'More',
                  imagePath: 'more.png',
                  onTap: () {},
                ),
              ],
            ),
            verticalSpace(10),

            // REKOMENDASI---------------------------------------------------------------------------------------------

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Rekomendasi',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      verticalSpace(4),
                      const Text(
                        'Restoran & Cafe',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: customPurple2.withOpacity(0.12),
                          padding: const EdgeInsetsDirectional.symmetric(
                              horizontal: 20, vertical: 12)),
                      onPressed: () {},
                      child: const Text(
                        'Browse More',
                        style: TextStyle(color: customPurple2),
                      ))
                ],
              ),
            ),

            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: 3,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return const PlaceItem();
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('See more food & beverages')),
            ),
            verticalSpace(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Browse Food & Beverages',
                style: largeText(size: 18),
              ),
            ),
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
            verticalSpace(30)
          ],
        ));
  }
}
