import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/components/device_util.dart';
import 'package:landlord/data/model/sub_category_model.dart';
import 'package:landlord/utils/theme/app_colors.dart';

import '../../../utils/nav_utail.dart';
import '../../details/view/details_page.dart';

class CustomSliderNews extends StatelessWidget {
  final AsyncSnapshot<SubCategoryModel?>? snapShot;
  const CustomSliderNews(
      {super.key, required CarouselController controller2, this.snapShot})
      : _controller2 = controller2;

  final CarouselController _controller2;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: snapShot?.data?.data?.slider?.length ?? 0,
          options: CarouselOptions(
            height: 230,
            viewportFraction: 1,
            aspectRatio: DeviceUtil.isTablet ? 1.09.sp : 1.78.sp,
            enlargeCenterPage: false,
            autoPlay: true,
          ),
          itemBuilder: (ctx, index, realIdx) {
            final data = snapShot?.data?.data?.slider?[index];
            return Container(
                padding: const EdgeInsets.all(0),
                child: InkWell(
                  onTap: () {
                    NavUtil.navigateScreen(
                        context,
                        DetailsPage(
                          slug: snapShot!.data!.data!.slider![index].slug!,
                        ));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          CachedNetworkImage(
                            height: DeviceUtil.isTablet ? 200.h : 160.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            imageUrl: "${data?.pathLarge}",
                            placeholder: (context, url) => Center(
                              child: Image.asset(
                                  "assets/images/no_image_found.png"),
                            ),
                            errorWidget: (context, url, error) =>
                                Image.asset("assets/images/no_image_found.png"),
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
                                  child: CustomText(
                                    text: data?.category,
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
                                    text: data?.title,
                                    color: whiteColor,
                                    fontSize: 10.r,
                                    maxLine: 1,
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
                  ),
                ));
          },
          carouselController: _controller2,
        ),
      ],
    );
  }
}
