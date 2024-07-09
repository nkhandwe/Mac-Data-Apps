import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class ParentMobileAppBar extends StatelessWidget {
  final String? appbarName;
  const ParentMobileAppBar({super.key, this.appbarName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.only(left: 10.0.w, top: 8.h, bottom: 8.h),
        child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            )),
      ),
      leadingWidth: 60.w,
      automaticallyImplyLeading: true,
      backgroundColor: colorPrimary,
      elevation: 0,
      title: Text(
        appbarName!,
        style: TextStyle(
            fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.w700),
      ).tr(),
      actions: [
        Padding(
          padding:
              EdgeInsets.only(left: 26.0.w, top: 8.h, bottom: 8.h, right: 8.h),
          child: InkWell(
            onTap: () {
              // NavUtil.navigateScreen(
              //     context,
              //     const NotificationScreen(
              //       isBottomNav: false,
              //     ));
            },
            child: Image.asset('assets/dashboard/notification_vector.png'),
          ),
        ),
      ],
    );
  }
}
