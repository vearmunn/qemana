import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../core/utils/colors.dart';
import '../core/utils/spacer.dart';
import '../core/utils/texts.dart';
import 'roundedContainer.dart';

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
