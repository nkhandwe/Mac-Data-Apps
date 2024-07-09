import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/components/device_util.dart';
import 'package:landlord/data/model/breaking_news_slider_model.dart';
import 'package:landlord/utils/shimmers.dart';
import 'package:landlord/utils/theme/app_colors.dart';

import '../../../utils/nav_utail.dart';
import '../../details/view/details_page.dart';

class SliverCommonNewsContent extends StatelessWidget {
  final NewsResponse? serialNewsData;
  const SliverCommonNewsContent({super.key, this.serialNewsData});

  @override
  Widget build(BuildContext context) {
    return serialNewsData?.data != null
        ? SliverList.builder(
            itemCount: serialNewsData?.data?.length ?? 0,
            itemBuilder: (context, index) {
              final data = serialNewsData?.data?[index];
              return Padding(
                padding: const EdgeInsets.all(16.0),
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
                        width: double.infinity,
                        fit: BoxFit.cover,
                        imageUrl: "${data?.pathLarge}",
                        placeholder: (context, url) => Center(
                          child:
                              Image.asset("assets/images/no_image_found.png"),
                        ),
                        errorWidget: (context, url, error) =>
                            Image.asset("assets/images/no_image_found.png"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: data?.category,
                        color: redColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 12.r,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      CustomText(
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
                            size: 11.h,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          CustomText(
                            text: data?.updatedAt,
                            fontSize: 10.r,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          )
        : serialNewsData?.data?.length != 0
            ? SliverList(
                delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      RectangularCardShimmer(
                          height: DeviceUtil.isTablet ? 55 : 180,
                          width: double.infinity),
                      SizedBox(height: 10.h),
                      RectangularCardShimmer(
                          height: DeviceUtil.isTablet ? 55 : 30,
                          width: double.infinity),
                      SizedBox(height: 10.h),
                      RectangularCardShimmer(
                          height: DeviceUtil.isTablet ? 55 : 60,
                          width: double.infinity),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ]))
            : const SizedBox();
  }
}
