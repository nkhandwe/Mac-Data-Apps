import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  final String? appBarName;
  final Function()? onTap;
  final bool? isBackButton;
  final List<Widget>? actions;
  const CustomAppBar(
      {super.key, this.appBarName, this.onTap, this.isBackButton, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Visibility(
        visible: isBackButton ?? true,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            'assets/dashboard/back_vector.png',
            scale: 4,
          ),
        ),
      ),
      leadingWidth: 60,
      automaticallyImplyLeading: false,
      backgroundColor: colorPrimary,
      elevation: 1,
      title: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          '$appBarName',
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.white,
              fontWeight: FontWeight.w700),
        ).tr(),
      ),
      // actions: actions ??
      //     [
      //       Padding(
      //         padding: const EdgeInsets.only(right: 12, bottom: 16, top: 5),
      //         child: Image.asset(
      //           'assets/dashboard/notification_vector.png',
      //           scale: 4,
      //         ),
      //       ),
      //     ],
    );
  }
}
