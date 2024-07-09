import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/dashboard_drawer.dart';
import 'package:landlord/components/device_util.dart';
import 'package:landlord/components/global_app_bar.dart';
import 'package:landlord/pages/article/content/saved_article_content.dart';
import 'package:landlord/pages/home/content/news_drawer.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              DashboardDrawerContent(scaffoldKey: scaffoldKey),
              SizedBox(
                height: 16.h,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: greyColor.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'saved_article'.tr(),
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 16.r),
                    ),
                    const Divider(
                      thickness: 0.6,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const SavedArticleContent(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
