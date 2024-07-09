import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/components/device_util.dart';
import 'package:landlord/data/provider/home_provider.dart';
import 'package:landlord/utils/shimmers.dart';
import 'package:provider/provider.dart';

class SliderFeaturedNews extends StatelessWidget {
  const SliderFeaturedNews({
    super.key,
    required CarouselController controller1,
  }) : _controller1 = controller1;

  final CarouselController _controller1;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    return SliverList(
        delegate: SliverChildListDelegate([
      provider.breakingScrollingData?.data?.isNotEmpty == true
          ? Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: CarouselSlider.builder(
                    itemCount:
                        provider.breakingScrollingData?.data?.length ?? 0,
                    options: CarouselOptions(
                      viewportFraction: 1,
                      aspectRatio: DeviceUtil.isTablet ? 1.sp : 1.8.sp,
                      enlargeCenterPage: false,
                      autoPlay: true,
                    ),
                    itemBuilder: (ctx, index, realIdx) {
                      final data = provider.breakingScrollingData?.data?[index];
                      return Container(
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CachedNetworkImage(
                                height: DeviceUtil.isTablet ? 180.h : 160.h,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                imageUrl: "${data?.pathLarge}",
                                placeholder: (context, url) => Center(
                                  child: Image.asset(
                                      "assets/images/no_image_found.png"),
                                ),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                        "assets/images/no_image_found.png"),
                              ),
                            ],
                          ));
                    },
                    carouselController: _controller1,
                  ),
                ),
                // Positioned(
                //     top: 10.h,
                //     right: 20.w,
                //     child: Row(
                //       children: [
                //         InkWell(
                //           onTap: () {
                //             _controller1.previousPage();
                //           },
                //           child: Icon(
                //             Icons.arrow_back_ios,
                //             size: 17.r,
                //             color: blackColor,
                //           ),
                //         ),
                //         InkWell(
                //           onTap: () {
                //             _controller1.nextPage();
                //           },
                //           child: Icon(
                //             Icons.arrow_forward_ios,
                //             size: 17.r,
                //             color: blackColor,
                //           ),
                //         ),
                //       ],
                //     ))
              ],
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: RectangularCardShimmer(
                height: DeviceUtil.isTablet ? 320.h : 280.h,
                width: double.infinity,
              ),
            ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
                fontSize: 14.r,
                maxLine: 1,
                fontWeight: FontWeight.w700,
                text: provider.breakingScrollingData?.data?[0].title),
            SizedBox(
              height: 6.h,
            ),
            CustomText(
                maxLine: 3,
                fontSize: 11.r,
                text: provider.breakingScrollingData?.data?[0].content)
          ],
        ),
      )
    ]));
  }
}
