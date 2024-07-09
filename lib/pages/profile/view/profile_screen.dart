import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/dashboard_drawer.dart';
import 'package:landlord/components/device_util.dart';
import 'package:landlord/components/global_app_bar.dart';
import 'package:landlord/pages/home/content/news_drawer.dart';
import 'package:landlord/pages/profile/content/profile_content.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

    return Scaffold(
      key: scaffoldKey,
      drawer: const NewsDrawer(),
      backgroundColor: whiteColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(DeviceUtil.isTablet ? 120 : 95),
          child: const GlobalAppBar()),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DashboardDrawerContent(scaffoldKey: scaffoldKey),
            SizedBox(
              height: 20.h,
            ),
            const ProfileContent()
          ],
        ),
      ),
    );
  }
}
