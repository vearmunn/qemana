import 'package:flutter/material.dart';
import '../core/models/place.dart';

import '../core/utils/colors.dart';
import '../core/utils/spacer.dart';
import '../core/utils/texts.dart';
import 'roundedContainer.dart';

class PlaceItem extends StatelessWidget {
  final Place place;

  const PlaceItem({
    super.key,
    required this.place,
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
                      place.isOpen ? 'OPEN' : 'CLOSED',
                      style: smallText(
                          color: place.isOpen
                              ? Colors.green[600]
                              : Colors.red[600],
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
                    place.openingHours,
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
                      place.rating.toString(),
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
                    '${place.distance} km ke lokasi',
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
                    place.category,
                    style: smallText(),
                  ),
                ],
              ),
            ],
          ),
          verticalSpace(6),
          Text(
            place.name,
            style: largeText(size: 22),
          ),
          verticalSpace(30)
        ],
      ),
    );
  }
}
