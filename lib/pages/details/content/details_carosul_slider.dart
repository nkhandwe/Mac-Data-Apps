import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/device_util.dart';

import '../../../data/model/news_details_model.dart';

class DetailsCarousalSlider extends StatelessWidget {
  const DetailsCarousalSlider(
      {super.key,
      required CarouselController controller,
      required this.newsDetails})
      : _controller = controller;

  final CarouselController _controller;
  final NewsDetailsModel newsDetails;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 100,
      options: CarouselOptions(
        height: 180.h,
        viewportFraction: 1,
        aspectRatio: DeviceUtil.isTablet ? 1.1.sp : 1.8.sp,
        enlargeCenterPage: false,
        autoPlay: true,
      ),
      itemBuilder: (ctx, index, realIdx) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              width: double.infinity,
              height: 160.h,
              fit: BoxFit.cover,
              imageUrl: newsDetails.data?.news?.pathLarge ?? "",
              placeholder: (context, url) => Center(
                child: Image.asset("assets/images/no_image_found.png"),
              ),
              errorWidget: (context, url, error) =>
                  Image.asset("assets/images/no_image_found.png"),
            ),
          ],
        );
      },
      carouselController: _controller,
    );
  }
}
