// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:sizer/sizer.dart';

import 'package:qemana/core/utils/spacer.dart';

import '../../../../core/utils/colors.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    const onboardingData = [
      {
        'imageUrl': 'assets/images/onboard_image.png',
        'title': 'Find',
        'description':
            'Find Place to plan you next Visit, Restaurant, Bar, Cafee, Mall You Name It All just in one place',
      },
      {
        'imageUrl': 'assets/images/onboard_image.png',
        'title': 'Visit',
        'description':
            'Find Place to plan you next Visit, Restaurant, Bar, Cafee, Mall You Name It All just in one place',
      },
      {
        'imageUrl': 'assets/images/onboard_image.png',
        'title': 'Love',
        'description':
            'Find Place to plan you next Visit, Restaurant, Bar, Cafee, Mall You Name It All just in one place',
      },
    ];
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlutterCarousel.builder(
            options: FlutterCarouselOptions(
                height: 35.h,
                showIndicator: true,
                viewportFraction: 1,
                slideIndicator: CircularWaveSlideIndicator(
                    slideIndicatorOptions: const SlideIndicatorOptions(
                  itemSpacing: 16,
                  currentIndicatorColor: Colors.grey,
                  indicatorBackgroundColor: Colors.white,
                ))),
            itemCount: onboardingData.length,
            itemBuilder: (context, index, realIndex) {
              return Container(
                  width: 100.w,
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Image.asset(onboardingData[index]['imageUrl']!),
                      verticalSpace(24),
                      Text(
                        onboardingData[index]['title']!,
                        style: const TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      verticalSpace(12),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Text(
                          onboardingData[index]['description']!,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ));
            },
          ),
          verticalSpace(30),
          Container(
            width: 100.w,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.amber.withAlpha(40),
                      radius: 35,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset('assets/images/Logo.png'),
                      ),
                    ),
                    horizontalSpace(20),
                    const Text(
                      'Get\nStarted',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                verticalSpace(28),
                CustomizedButton(
                    bgColor: Colors.black,
                    child: const Text('Continue Signing Up'),
                    onPressed: () {}),
                verticalSpace(10),
                CustomizedButton(
                  onPressed: () {},
                  bgColor: Colors.grey[300]!,
                  child: const Text(
                    'Account Login',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                verticalSpace(12),
                Row(
                  children: [
                    Expanded(
                      child: CustomizedButton(
                        onPressed: () {},
                        bgColor: Colors.grey[300]!,
                        child: Image.asset('assets/images/facebook.png'),
                      ),
                    ),
                    horizontalSpace(12),
                    Expanded(
                      child: CustomizedButton(
                        onPressed: () {},
                        bgColor: Colors.grey[300]!,
                        child: Image.asset('assets/images/google.png'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomizedButton extends StatelessWidget {
  const CustomizedButton({
    super.key,
    required this.bgColor,
    required this.child,
    required this.onPressed,
  });

  final Color bgColor;
  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
          ),
          child: child),
    );
  }
}
