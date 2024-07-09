import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class LatestNewsContent extends StatelessWidget {
  const LatestNewsContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          width: double.infinity,
          color: blackColor,
          child: Center(
              child: Text(
            "latest".tr(),
            style: TextStyle(
                color: whiteColor, fontSize: 14.r, fontWeight: FontWeight.w700),
          )),
        ),
        const SizedBox(
          height: 10,
        ),
        const Icon(
          Icons.play_arrow,
          size: 16,
          color: greyColor,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomText(
          text:
              "12th parliamentary election: 71 incumbent MPs fail to fet AL tickets as many as",
          color: blackColor,
          fontWeight: FontWeight.w700,
          maxLine: 2,
          textAlign: TextAlign.justify,
          fontSize: 12.r,
        ),
        SizedBox(
          height: 5.h,
        ),
        Row(
          children: [
            Icon(
              Icons.access_time,
              size: 14.r,
              color: black2Sd,
            ),
            SizedBox(
              width: 6.w,
            ),
            CustomText(
              text: 'Update 23 july 23 | 12:06',
              color: black2Sd,
              fontSize: 11.r,
            ),
            SizedBox(width: 7.w),
            CustomText(
              text: ' | National',
              color: redColor,
              fontSize: 11.r,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ],
    );
  }
}
