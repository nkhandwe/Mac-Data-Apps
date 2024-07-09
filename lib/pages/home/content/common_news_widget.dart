import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/components/device_util.dart';
import 'package:landlord/data/model/breaking_news_slider_model.dart';
import 'package:landlord/utils/theme/app_colors.dart';

import '../../../utils/nav_utail.dart';
import '../../details/view/details_page.dart';

class CommonNewsWidget extends StatelessWidget {
  final NewsResponse? provider;
  const CommonNewsWidget({super.key, this.provider});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: provider?.data?.length ?? 0,
      itemBuilder: (context, index) {
        final data = provider?.data?[index];
        return InkWell(
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
                height: DeviceUtil.isTablet ? 220.h : 190.h,
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
                text: data?.category,
                color: redColor,
                fontWeight: FontWeight.w700,
                fontSize: 14.r,
              ),
              SizedBox(
                height: 8.h,
              ),
              CustomText(
                maxLine: 1,
                text: data?.title,
                fontWeight: FontWeight.w700,
                fontSize: 14.r,
              ),
              SizedBox(
                height: 8.h,
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
                    text: data?.updatedAt,
                    fontSize: 10.r,
                  )
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
            ],
          ),
        );
      },
    );
  }
}
