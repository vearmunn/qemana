// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';

// import 'package:qemana/utils/texts.dart';

// import '../../utils/colors.dart';
// import '../../utils/spacer.dart';
// import '../../widgets/place_item.dart';
// import '../../widgets/roundedContainer.dart';

// class HomePageOld extends StatelessWidget {
//   const HomePageOld({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         backgroundColor: backGroundColor,
//         appBar: AppBar(
//           backgroundColor: backGroundColor,
//           elevation: 0,
//           toolbarHeight: 100,
//           title: Row(
//             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               RoundedContainer(
//                 padding: 8,
//                 child: Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundColor: mainShade,
//                       child: Image.asset('assets/images/Logo 1.png'),
//                     ),
//                     horizontalSpace(16),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Bogor Timur, Bogor',
//                           style: extraSmallText(size: 8),
//                         ),
//                         verticalSpace(4),
//                         Text(
//                           'Mau Qemana hari ini...',
//                           style: extraSmallText(
//                               size: 9,
//                               color: customBlack,
//                               weight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                     horizontalSpace(8),
//                     const Icon(
//                       Icons.arrow_drop_down,
//                       color: Colors.grey,
//                     )
//                   ],
//                 ),
//               ),
//               Expanded(child: horizontalSpace(0)),
//               RoundedContainer(
//                 padding: 16,
//                 child: Badge(
//                     label: const Text('2'),
//                     backgroundColor: customPurple,
//                     offset: const Offset(10, -5),
//                     child: Image.asset('assets/images/favourite.png')),
//               ),
//               horizontalSpace(8),
//               RoundedContainer(
//                 padding: 16,
//                 child: Badge(
//                     label: const Text('2'),
//                     backgroundColor: customPurple,
//                     offset: const Offset(6, -5),
//                     child: Image.asset('assets/images/notification.png')),
//               ),
//             ],
//           ),
//           bottom: TabBar(
//               indicatorSize: TabBarIndicatorSize.tab,
//               indicatorColor: mainColor,
//               tabs: [
//                 Tab(
//                   icon: Image.asset('assets/images/terdekat.png'),
//                   child: Text(
//                     'Terdekat',
//                     style: extraSmallText(
//                         color: customBlack, weight: FontWeight.bold),
//                   ),
//                 ),
//                 Tab(
//                   icon: Image.asset('assets/images/trending.png'),
//                   child: Text(
//                     'Trending',
//                     style: extraSmallText(
//                         color: customBlack, weight: FontWeight.bold),
//                   ),
//                 ),
//                 Tab(
//                   icon: Image.asset('assets/images/populer.png'),
//                   child: Text(
//                     'Populer',
//                     style: extraSmallText(
//                         color: customBlack, weight: FontWeight.bold),
//                   ),
//                 ),
//                 Tab(
//                   icon: Image.asset('assets/images/history.png'),
//                   child: Text(
//                     'History',
//                     style: extraSmallText(
//                         color: customBlack, weight: FontWeight.bold),
//                   ),
//                 ),
//               ]),
//         ),
//         body: const TabBarView(children: [
//           TabTerdekat(),
//           Center(
//             child: Text('Trending'),
//           ),
//           Center(
//             child: Text('Populer'),
//           ),
//           Center(
//             child: Text('History'),
//           ),
//         ]),
//       ),
//     );
//   }
// }

// class TabTerdekat extends StatelessWidget {
//   const TabTerdekat({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: const EdgeInsets.symmetric(vertical: 20),
//       children: [
//         ListView.builder(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           itemCount: 3,
//           physics: const NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           itemBuilder: (BuildContext context, int index) {
//             return const PlaceItem();
//           },
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: ElevatedButton(
//               onPressed: () {}, child: const Text('See more food & beverages')),
//         ),
//         verticalSpace(30),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Text(
//             'Browse Food & Beverages',
//             style: largeText(size: 18),
//           ),
//         ),
//         verticalSpace(15),
//         SizedBox(
//           height: 200,
//           child: ListView.builder(
//             itemCount: 3,
//             shrinkWrap: true,
//             padding: const EdgeInsets.only(left: 20),
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (BuildContext context, int index) {
//               return Stack(
//                 children: [
//                   Container(
//                       margin: const EdgeInsets.only(right: 15),
//                       width: MediaQuery.of(context).size.width * 0.6,
//                       height: 200,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(30),
//                         child: Image.network(
//                           'https://cdn.pixabay.com/photo/2016/11/29/12/54/cafe-1869656_1280.jpg',
//                           fit: BoxFit.cover,
//                         ),
//                       )),
//                   Container(
//                     margin: const EdgeInsets.only(right: 15),
//                     width: MediaQuery.of(context).size.width * 0.6,
//                     height: 200,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(25),
//                       color: Colors.black54,
//                     ),
//                   ),
//                   const Positioned(
//                     right: 25,
//                     top: 15,
//                     child: RoundedContainer(
//                         padding: 15,
//                         color: Colors.black45,
//                         child: Icon(
//                           Icons.location_on_outlined,
//                           color: Colors.white,
//                         )),
//                   ),
//                   Positioned(
//                       left: 25,
//                       bottom: 15,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Restaurants',
//                             style: largeText(color: Colors.white, size: 22),
//                           ),
//                           Text(
//                             '134 locations near you',
//                             style: extraSmallText(color: Colors.white),
//                           ),
//                         ],
//                       )),
//                 ],
//               );
//             },
//           ),
//         ),
//         verticalSpace(30)
//       ],
//     );
//   }
// }
