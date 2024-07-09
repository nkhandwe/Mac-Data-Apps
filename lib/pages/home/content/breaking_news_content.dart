import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/components/device_util.dart';
import 'package:landlord/data/provider/home_provider.dart';
import 'package:landlord/pages/home/content/breaking_news_item.dart';
import 'package:landlord/utils/shimmers.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class BreakingNewsContent extends StatelessWidget {
  const BreakingNewsContent({
    super.key,
    required CarouselController controller,
  }) : _controller = controller;

  final CarouselController _controller;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    return provider.newsResponseData?.data?.isNotEmpty == true
        ? SliverList(
            delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 10.h),
              child: Row(children: [
                Expanded(
                  child: CustomText(
                    text: 'breaking_news',
                    color: blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.r,
                  ),
                ),
                InkWell(
                  onTap: () {
                    _controller.previousPage();
                  },
                  child: Icon(Icons.arrow_back_ios, size: 18.r),
                ),
                InkWell(
                  onTap: () {
                    _controller.nextPage();
                  },
                  child: Icon(Icons.arrow_forward_ios, size: 18.r),
                ),
              ]),
            ),
            const Divider(
              color: blackColor,
              indent: 16,
              endIndent: 16,
              thickness: 0.2,
            ),
            CarouselSlider.builder(
              itemCount: provider.newsResponseData?.data?.length ?? 0,
              options: CarouselOptions(
                height: 280.h,
                viewportFraction: 1,
                aspectRatio: DeviceUtil.isTablet ? .65.sp : 1.21.sp,
                enlargeCenterPage: false,
                autoPlay: false,
              ),
              itemBuilder: (ctx, index, realIdx) {
                final data = provider.newsResponseData?.data?[index];
                return BreakingNewsItem(
                  data: data,
                );
              },
              carouselController: _controller,
            )
          ]))
        : SliverList(
            delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  RectangularCardShimmer(
                      height: DeviceUtil.isTablet ? 55 : 30,
                      width: double.infinity),
                  SizedBox(height: 10.h),
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
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ]));
  }
}
