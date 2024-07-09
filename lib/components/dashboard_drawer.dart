import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class DashboardDrawerContent extends StatelessWidget {
  const DashboardDrawerContent({
    super.key,
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) : _scaffoldKey = scaffoldKey;

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'dashboard_menu'.tr(),
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.r),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            decoration: BoxDecoration(
              color: blackColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(
              Icons.menu_outlined,
              color: whiteColor,
              size: 18.r,
            ),
          ),
        )
      ],
    );
  }
}
