import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class StudentListMobileAppBar extends StatelessWidget {
  const StudentListMobileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.only(left: 26.0.w, top: 8.h, bottom: 8.h),
        child: InkWell(
          onTap: () => Scaffold.of(context).openDrawer(),
          child: Image.asset(
            'assets/dashboard/drawer_vector.png',
          ),
        ),
      ),
      leadingWidth: 60.w,
      automaticallyImplyLeading: true,
      backgroundColor: colorPrimary,
      elevation: 0,
      title: Text(
        "Student List",
        style: TextStyle(
            fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.w700),
      ).tr(),
      actions: const [
        // Padding(
        //   padding:
        //       EdgeInsets.only(left: 26.0.w, top: 8.h, bottom: 8.h, right: 8.h),
        //   child: InkWell(
        //     onTap: () {
        //       NavUtil.navigateScreen(
        //           context,
        //           const NotificationScreen(
        //             isBottomNav: false,
        //           ));
        //     },
        //     child: Image.asset('assets/dashboard/notification_vector.png'),
        //   ),
        // ),
      ],
    );
  }
}
