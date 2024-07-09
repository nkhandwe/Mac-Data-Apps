import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/device_util.dart';
import 'package:shimmer/shimmer.dart';

class TileShimmer extends StatelessWidget {
  final bool isLeading;
  final bool isTrailing;
  final bool isTitle;
  final bool isSubTitle;
  final double titleHeight;
  const TileShimmer(
      {super.key,
      this.isLeading = false,
      this.isTrailing = false,
      this.isTitle = true,
      this.isSubTitle = false,
      this.titleHeight = 12.0});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      horizontalTitleGap: 0.0,
      title: isTitle
          ? Shimmer.fromColors(
              baseColor: const Color(0xFFE8E8E8),
              highlightColor: Colors.white,
              child: Container(
                  height: titleHeight,
                  margin: const EdgeInsets.only(bottom: 16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8E8E8),
                    borderRadius: BorderRadius.circular(
                        100), // radius of 10// green as background color
                  )),
            )
          : const SizedBox.shrink(),
      subtitle: isSubTitle
          ? Shimmer.fromColors(
              baseColor: const Color(0xFFE8E8E8),
              highlightColor: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        height: DeviceUtil.isTablet ? 8.0.h : 8.0,
                        padding: const EdgeInsets.only(right: 24.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8E8E8),
                          borderRadius: BorderRadius.circular(
                              100), // radius of 10// green as background color
                        )),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  isTrailing
                      ? Shimmer.fromColors(
                          baseColor: const Color(0xFFE8E8E8),
                          highlightColor: Colors.white,
                          child: Container(
                              width: DeviceUtil.isTablet ? 36.0.w : 36.0,
                              height: DeviceUtil.isTablet ? 36.0.h : 36.0,
                              decoration: const BoxDecoration(
                                color: Color(0xFFE8E8E8),
                                shape: BoxShape
                                    .circle, // radius of 10// green as background color
                              )),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            )
          : const SizedBox.shrink(),
      leading: isLeading
          ? Shimmer.fromColors(
              baseColor: const Color(0xFFE8E8E8),
              highlightColor: Colors.white,
              child: Container(
                  width: DeviceUtil.isTablet ? 24.0.w : 24.0,
                  height: DeviceUtil.isTablet ? 24.0.h : 24.0,
                  padding: const EdgeInsets.only(right: 24.0),
                  decoration: const BoxDecoration(
                    color: Color(0xFFE8E8E8),
                    shape: BoxShape
                        .circle, // radius of 10// green as background color
                  )),
            )
          : const SizedBox.shrink(),
    );
  }
}

class RectangularCardShimmer extends StatelessWidget {
  final double width;
  final double height;

  const RectangularCardShimmer(
      {super.key, this.height = 110.0, this.width = 130.0});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFE8E8E8),
      highlightColor: Colors.white,
      child: Container(
          height: height,
          width: width,
          margin: const EdgeInsets.only(right: 0.0),
          decoration: BoxDecoration(
            color: const Color(0xFFE8E8E8),
            borderRadius: BorderRadius.circular(
                5.0), // radius of 10// green as background color
          )),
    );
  }
}

class HorizontalListShimmer extends StatelessWidget {
  const HorizontalListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: List.generate(
            6,
            (index) => const RectangularCardShimmer(),
          ),
        ),
      ),
    );
  }
}
