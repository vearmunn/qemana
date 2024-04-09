import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/spacer.dart';
import '../utils/texts.dart';
import 'roundedContainer.dart';

class PlaceItem extends StatelessWidget {
  const PlaceItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AspectRatio(
                  aspectRatio: 16 / 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      'https://cdn.pixabay.com/photo/2016/11/29/12/54/cafe-1869656_1280.jpg',
                      fit: BoxFit.cover,
                    ),
                  )),
              Positioned(
                right: 15,
                top: 15,
                child: Row(
                  children: [
                    RoundedContainer(
                      padding: 15,
                      color: Colors.black45,
                      child: Image.asset(
                        'assets/images/favourite.png',
                        color: Colors.white,
                      ),
                    ),
                    horizontalSpace(12),
                    const RoundedContainer(
                        padding: 15,
                        color: Colors.black45,
                        child: Icon(
                          Icons.location_on_outlined,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
            ],
          ),
          verticalSpace(15),
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
                horizontalSpace(5),
                const VerticalDivider(
                  indent: 8,
                  endIndent: 8,
                ),
                horizontalSpace(5),
                Expanded(
                  child: Text(
                    '09 AM - 08 PM',
                    style: smallText(color: Colors.grey),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.star_rate_rounded,
                      color: mainColor,
                      size: 35,
                    ),
                    horizontalSpace(5),
                    Text(
                      '4.6',
                      style: largeText(size: 22, color: customBlack),
                    )
                  ],
                ),
              ],
            ),
          ),
          verticalSpace(6),
          Row(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/location.png',
                    scale: 2,
                  ),
                  horizontalSpace(5),
                  Text(
                    '0.3 km ke lokasi',
                    style: smallText(),
                  ),
                ],
              ),
              horizontalSpace(10),
              Text(
                '•',
                style: regularText(color: Colors.grey),
              ),
              horizontalSpace(10),
              Row(
                children: [
                  Image.asset(
                    'assets/images/dish.png',
                    scale: 2,
                  ),
                  horizontalSpace(5),
                  Text(
                    'Food and Beverages',
                    style: smallText(),
                  ),
                ],
              ),
            ],
          ),
          verticalSpace(6),
          Text(
            'Sugarbites Bake & Sweets',
            style: largeText(size: 22),
          ),
          verticalSpace(30)
        ],
      ),
    );
  }
}
