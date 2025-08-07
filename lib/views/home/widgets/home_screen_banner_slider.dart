import 'package:carousel_slider/carousel_slider.dart';
import 'package:doclink/controllers/home_controller.dart';
import 'package:doclink/theme/app_colors.dart';
import 'package:doclink/views/home/widgets/banner_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenBannerSlider extends StatefulWidget {
  const HomeScreenBannerSlider({super.key});

  @override
  State<HomeScreenBannerSlider> createState() => _HomeScreenBannerSliderState();
}

class _HomeScreenBannerSliderState extends State<HomeScreenBannerSlider> {
  int activeIndex = 0;
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180,
          width: double.infinity,
          child: CarouselSlider.builder(
            itemCount: 3,
            itemBuilder: (context, index, realIndex) {
              return BannerCard(banner: controller.banners[index]);
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
            3,
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
