import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class NewsCategoryHeader extends StatelessWidget {
  const NewsCategoryHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      const SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "news".tr(),
              fontSize: 16.r,
              fontWeight: FontWeight.w700,
            ),
            const Divider(
              color: blackColor,
              thickness: 0.2,
            ),
            Wrap(
              children: [
                Text(
                  "Awami Leauge  | ",
                  style: TextStyle(
                      color: blackColor,
                      fontSize: 14.r,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 6.w),
                Text(
                  "BNP  | ",
                  style: TextStyle(
                      color: blackColor,
                      fontSize: 14.r,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 6.w),
                Text(
                  "National Party  | ",
                  style: TextStyle(
                      color: blackColor,
                      fontSize: 14.r,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 8),
                Text(
                  "All News  | ",
                  style: TextStyle(
                      color: blackColor,
                      fontSize: 14.r,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 8.w),
                Text(
                  "Others  ",
                  style: TextStyle(
                      color: blackColor,
                      fontSize: 14.r,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Stack(
              children: [
                Image.asset(
                  "assets/images/news_demo_image.png",
                  height: 350.h,
                  fit: BoxFit.cover,
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    bottom: 10,
                    child: Text(
                      "Commuter train torched in tangail, two compartments charred commuter train",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: blackColor,
                          fontSize: 12.r,
                          fontWeight: FontWeight.w600),
                    ))
              ],
            ),
            SizedBox(height: 14.w),
            CustomText(
              text: "Arrested on Suspicion, Relatives Not...",
              fontSize: 13.r,
              fontWeight: FontWeight.w600,
              color: blackColor,
            ),
            SizedBox(height: 8.h),
            Text(
              "Mohammad Helal is a third-year student of titumir College in Dhaka. He lives in the capital's",
              style: TextStyle(
                  color: black2Sd, fontSize: 14.r, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      )
    ]));
  }
}
