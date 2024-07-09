import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/components/device_util.dart';
import 'package:landlord/data/model/breaking_news_slider_model.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class CustomNewsItem extends StatelessWidget {
  final NewsData news;
  const CustomNewsItem({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          height: DeviceUtil.isTablet ? 200.h : 190.h,
          width: double.infinity,
          fit: BoxFit.cover,
          imageUrl: "${news.pathLarge}",
          placeholder: (context, url) => Center(
            child: Image.asset("assets/images/no_image_found.png"),
          ),
          errorWidget: (context, url, error) =>
              Image.asset("assets/images/no_image_found.png"),
        ),
        SizedBox(
          height: 8.h,
        ),
        CustomText(
          text: news.category,
          color: redColor,
          fontWeight: FontWeight.w700,
          fontSize: 14.r,
        ),
        SizedBox(
          height: 4.h,
        ),
        CustomText(
          maxLine: 1,
          text: news.title,
          fontWeight: FontWeight.w700,
          fontSize: 14.r,
        ),
        SizedBox(
          height: 4.h,
        ),
        Row(
          children: [
            Icon(
              Icons.watch_later_outlined,
              color: greyColor,
              size: 11.r,
            ),
            SizedBox(
              width: 5.w,
            ),
            CustomText(
              text: news.updatedAt,
              fontSize: 10.r,
            )
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
      ],
    );
  }
}
