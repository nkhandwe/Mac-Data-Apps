import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/components/device_util.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class VideoNewsContent extends StatelessWidget {
  const VideoNewsContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      Container(
        color: blackColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(children: [
                CustomText(
                  text: 'Video',
                  color: whiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.r,
                ),
                const Spacer(),
                CustomText(
                  text: 'view_all'.tr(),
                  color: whiteColor,
                  fontSize: 13.r,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15.r,
                  color: whiteColor,
                )
              ]),
              SizedBox(
                height: 10.h,
              ),
              const Divider(
                thickness: 0.5,
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                color: blackColor.withOpacity(0.7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          "assets/images/news_demo_image.png",
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          left: 10.w,
                          bottom: 10.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
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
                                  text: "Quest 2 Launched",
                                  color: whiteColor,
                                  fontSize: 10.r,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                            left: 0,
                            right: 0,
                            top: DeviceUtil.isTablet ? 90.sp : 70.sp,
                            child: Container(
                              height: 40.h,
                              decoration: const BoxDecoration(
                                  color: redColor, shape: BoxShape.circle),
                              child: const Icon(
                                Icons.play_arrow,
                                color: whiteColor,
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text:
                                "12th parliamentary election: 71 incumbent MPs",
                            fontWeight: FontWeight.w700,
                            color: whiteColor,
                            fontSize: 11.r,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.watch_later_outlined,
                                color: greyColor,
                                size: 12.r,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              CustomText(
                                text: "Update 23 July 23 | 12:6 p.m",
                                fontSize: 10.r,
                                color: whiteColor,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomText(
                            maxLine: 3,
                            text:
                                "12th parliamentary election: 71 incumbent MPs 12th parliamentary election: 71 incumbent MPs ",
                            color: whiteColor,
                            fontSize: 11.r,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    ]));
  }
}
