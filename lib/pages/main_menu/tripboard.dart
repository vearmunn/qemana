import 'package:flutter/material.dart';
import 'package:image_collage/image_collage.dart';
import 'package:qemana/utils/colors.dart';
import 'package:sizer/sizer.dart';

import '../../utils/spacer.dart';
import '../../utils/texts.dart';
import '../../widgets/roundedContainer.dart';

class TripboardPage extends StatelessWidget {
  const TripboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RoundedContainer(
                  padding: 16,
                  useBorder: true,
                  child: Image.asset('assets/images/Logo 1.png'),
                ),
                Text(
                  'My Tribboard',
                  style: largeText(size: 20),
                ),
                const RoundedContainer(
                  useBorder: true,
                  padding: 12,
                  child: Icon(
                    Icons.more_vert,
                    color: customBlack,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 18),
                  prefixIcon: Image.asset(
                    'assets/images/search.png',
                    color: customBlack,
                  ),
                  hintText: 'Search Tripboard',
                  hintStyle: TextStyle(color: Colors.grey[400]!),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: mainColor)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.grey[400]!))),
            ),
          ),
          verticalSpace(12),
          GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 100.h <= 800 ? 3 / 5 : 2 / 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2),
              itemCount: 4,
              itemBuilder: (context, index) {
                return const TripboardItemCard();
              }),
        ],
      ),
    );
  }
}

class TripboardItemCard extends StatelessWidget {
  const TripboardItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: ImageCollage(images: [
                Img(
                    image:
                        'https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823_1280.jpg',
                    source: ImageSource.network),
                Img(
                    image:
                        'https://cdn.pixabay.com/photo/2016/11/29/12/54/cafe-1869656_1280.jpg',
                    source: ImageSource.network),
                Img(
                    image:
                        'https://cdn.pixabay.com/photo/2024/03/05/20/48/church-8615302_1280.jpg',
                    source: ImageSource.network),
                Img(
                    image:
                        'https://cdn.pixabay.com/photo/2016/11/29/12/54/cafe-1869656_1280.jpg',
                    source: ImageSource.network),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Image.asset('assets/images/calendar-02.png'),
                horizontalSpace(8),
                Text(
                  '22/08/2024',
                  style: smallText(),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12),
            child: Text(
              'Trip Trip Bali Bail asdj as yumen',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: mediumText(weight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
