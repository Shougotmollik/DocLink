import 'package:carousel_slider/carousel_slider.dart';
import 'package:doclink/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreenBannerSlider extends StatefulWidget {
  const HomeScreenBannerSlider({super.key});

  @override
  State<HomeScreenBannerSlider> createState() => _HomeScreenBannerSliderState();
}

class _HomeScreenBannerSliderState extends State<HomeScreenBannerSlider> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      spacing: 10,
      children: [
        SizedBox(
          height: 180,
          width: double.infinity,
          child: CarouselSlider.builder(
            itemCount: 4,
            itemBuilder: (context, index, realIndex) {
              return Container(
                height: 180,
                width: 360,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/person.png',
                        height: 160,
                        width: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 18),
                          Text(
                            'Medical Center',
                            style: textTheme.bodyMedium?.copyWith(
                              color: AppColors.onPrimary,
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 18),
                          Text(
                            'Get access to top-rated hospitals and specialists in one place.',
                            textAlign: TextAlign.start,
                            style: textTheme.bodySmall?.copyWith(
                              color: AppColors.onPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            options: CarouselOptions(
              height: 160,
              viewportFraction: 1,
              reverse: false,
              enableInfiniteScroll: true,
              aspectRatio: 16 / 9,
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(seconds: 2),
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            4,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: activeIndex == index ? 18 : 12,
              height: 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(width: 0.8, color: Colors.black38),
                color: activeIndex == index
                    ? AppColors.primary.withAlpha(180)
                    : Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
