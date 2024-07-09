import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/custom_text.dart';
import '../../../components/device_util.dart';
import '../../../data/model/breaking_news_slider_model.dart';
import '../../../utils/nav_utail.dart';
import '../../../utils/theme/app_colors.dart';
import '../../details/view/details_page.dart';

class BreakingNewsItem extends StatelessWidget {
  final NewsData? data;
  const BreakingNewsItem({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        child: InkWell(
          onTap: () {
            NavUtil.navigateScreen(
                context,
                DetailsPage(
                  slug: data!.slug!,
                ));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                height: DeviceUtil.isTablet ? 200.h : 160.h,
                width: double.infinity,
                fit: BoxFit.cover,
                imageUrl: "${data?.pathLarge}",
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
                text: data?.title,
                fontSize: 15.r,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                height: 4.h,
              ),
              CustomText(
                maxLine: 2,
                text: data?.content,
                fontSize: 12.r,
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                children: [
                  CustomText(text: 'By', fontSize: 9.r),
                  SizedBox(
                    width: 4.w,
                  ),
                  CustomText(
                    text: data?.author,
                    fontSize: 9.r,
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Icon(
                    Icons.circle,
                    size: 10.sp,
                    color: greyColor,
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  CustomText(
                    text: data?.updatedAt,
                    fontSize: 9.r,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
