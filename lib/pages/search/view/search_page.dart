import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/data/provider/search_provider.dart';
import 'package:landlord/pages/details/content/marquee_text_widget.dart';
import 'package:landlord/pages/home/content/common_news_widget.dart';
import 'package:landlord/pages/search/content/search_drop_down_item.dart';
import 'package:landlord/pages/search/content/search_text_filed.dart';
import 'package:landlord/utils/no_data_found_widget.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchProvider(context),
      child: Consumer<SearchProvider>(builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: whiteColor,
          appBar: AppBar(
            title: Center(
              child: Image.asset(
                'assets/drawer/app_logo.png',
                height: 15.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MarqueeTextWidget(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'search'.tr(),
                        style: TextStyle(
                            color: blackColor,
                            fontSize: 16.r,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 1,
                        width: 60.w,
                        color: Colors.red,
                      ),
                      const SizedBox(height: 12),
                      SearchDropDownItem(provider: provider), //DropDown Widget
                      const SizedBox(
                        height: 10,
                      ),
                      SearchTextField(provider: provider), // SearchBox Widget
                      SizedBox(height: 10.h),
                      const Divider(thickness: 0.6),
                      SizedBox(height: 10.h),
                      provider.newsData?.data?.isNotEmpty == true
                          ? CommonNewsWidget(provider: provider.newsData)
                          : const NoDataFoundWidget()
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
