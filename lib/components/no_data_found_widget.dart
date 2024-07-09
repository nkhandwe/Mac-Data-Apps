import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:landlord/components/device_util.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:lottie/lottie.dart';

class NoDataFoundWidget extends StatelessWidget {
  final String title;
  final String assetImage;

  const NoDataFoundWidget(
      {super.key,
      this.title = 'no_data_found',
      this.assetImage = 'assets/images/no_data_found.json'});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(assetImage,
            repeat: false, height: DeviceUtil.isTablet ? 400 : 200),
        Text(
          title.tr(),
          style: TextStyle(
              color: colorPrimary.withOpacity(0.4),
              fontSize: DeviceUtil.isTablet ? 36 : 18,
              fontWeight: FontWeight.w500),
        ).tr(),
      ],
    ));
  }
}
