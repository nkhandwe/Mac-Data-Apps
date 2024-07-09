import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/shimmer/shimmers.dart';

class NewsDetailsShimmer extends StatelessWidget {
  const NewsDetailsShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RectangularCardShimmer(
          width: double.infinity,
          height: 60.h,
        ),
        SizedBox(
          height: 10.h,
        ),
        RectangularCardShimmer(
          width: 100.w,
          height: 20.h,
        ),
        SizedBox(
          height: 10.h,
        ),
        RectangularCardShimmer(
          width: 100.w,
          height: 20.h,
        ),
        SizedBox(
          height: 10.h,
        ),
        RectangularCardShimmer(
          width: double.infinity,
          height: 200.w,
        ),
        SizedBox(
          height: 10.h,
        ),
        RectangularCardShimmer(
          width: double.infinity,
          height: 20.h,
        ),
        SizedBox(
          height: 10.h,
        ),
        RectangularCardShimmer(
          width: double.infinity,
          height: 20.h,
        ),
        SizedBox(
          height: 10.h,
        ),
        RectangularCardShimmer(
          width: double.infinity,
          height: 20.h,
        ),
        SizedBox(
          height: 10.h,
        ),
        RectangularCardShimmer(
          width: double.infinity,
          height: 20.h,
        ),
        SizedBox(
          height: 10.h,
        ),
        RectangularCardShimmer(
          width: double.infinity,
          height: 20.h,
        ),
        SizedBox(
          height: 10.h,
        ),
        RectangularCardShimmer(
          width: double.infinity,
          height: 20.h,
        ),
        SizedBox(
          height: 10.h,
        ),
        RectangularCardShimmer(
          width: double.infinity,
          height: 20.h,
        ),
        SizedBox(
          height: 10.h,
        ),
        RectangularCardShimmer(
          width: double.infinity,
          height: 20.h,
        ),
      ],
    );
  }
}
