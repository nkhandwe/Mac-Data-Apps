import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/components/device_util.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class PhotosNewsContent extends StatelessWidget {
  const PhotosNewsContent({
    super.key,
    required CarouselController controller2,
  }) : _controller2 = controller2;

  final CarouselController _controller2;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Row(children: [
          CustomText(
            text: 'photos'.tr(),
            color: blackColor,
            fontWeight: FontWeight.bold,
            fontSize: 18.r,
          ),
          const Spacer(),
          CustomText(
            text: 'view_all'.tr(),
            color: blackColor,
            fontSize: 12.r,
          ),
          SizedBox(
            width: 6.w,
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 12.r,
            color: blackColor,
          )
        ]),
      ),
      const Divider(
        color: blackColor,
        indent: 16,
        endIndent: 16,
        thickness: 0.2,
      ),
      Stack(
        children: [
          CarouselSlider.builder(
            itemCount: 100,
            options: CarouselOptions(
              viewportFraction: 1,
              aspectRatio: DeviceUtil.isTablet ? 1.09.sp : 1.7.sp,
              enlargeCenterPage: false,
              autoPlay: true,
            ),
            itemBuilder: (ctx, index, realIdx) {
              return Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            'assets/images/news_pic.jpeg',
                            height: 160.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            left: 10.w,
                            bottom: 5.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: redColor,
                                  ),
                                  child: const CustomText(
                                    text: "Bangladesh",
                                    color: whiteColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: blackColor.withOpacity(0.5),
                                  ),
                                  child: CustomText(
                                    text:
                                        "Soundcore VR Gaming Earbuds Designed for Meta",
                                    color: whiteColor,
                                    fontSize: 10.r,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ));
            },
            carouselController: _controller2,
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Row(children: [
                InkWell(
                  onTap: () {
                    _controller2.previousPage();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        color: blackColor, shape: BoxShape.circle),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 16.r,
                      color: whiteColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                InkWell(
                  onTap: () {
                    _controller2.nextPage();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        color: blackColor, shape: BoxShape.circle),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 16.r,
                      color: whiteColor,
                    ),
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/news_pic.jpeg',
                  height: 160.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 10.w,
                  bottom: 5.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: redColor,
                        ),
                        child: const CustomText(
                          text: "Bangladesh",
                          color: whiteColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: blackColor.withOpacity(0.5),
                        ),
                        child: CustomText(
                          text: "Soundcore VR Gaming Earbuds Designed for Meta",
                          color: whiteColor,
                          fontSize: 8.r,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    ]));
  }
}
