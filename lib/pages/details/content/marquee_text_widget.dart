import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/device_util.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:marquee/marquee.dart';

class MarqueeTextWidget extends StatelessWidget {
  const MarqueeTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DeviceUtil.isTablet ? 55 : 38,
      color: blackColor,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Marquee(
          text: '⭕  Some sample text that takes some space',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: whiteColor, fontSize: 14.r),
          scrollAxis: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.start,
          blankSpace: 20.0,
          velocity: 30.0,
          pauseAfterRound: const Duration(seconds: 0),
          startPadding: 10.0,
          accelerationDuration: const Duration(seconds: 1),
          accelerationCurve: Curves.linear,
          decelerationDuration: const Duration(milliseconds: 100),
          decelerationCurve: Curves.easeOut,
        ),
      ),
    );
  }
}
