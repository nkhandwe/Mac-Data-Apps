import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/dashboard_drawer.dart';
import 'package:landlord/components/device_util.dart';
import 'package:landlord/components/global_app_bar.dart';
import 'package:landlord/data/provider/my_post.dart';
import 'package:landlord/pages/home/content/news_drawer.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class PostListScreen extends StatelessWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

    return ChangeNotifierProvider(
      create: (context) => MyPostProvider(context),
      child: Consumer<MyPostProvider>(builder: (context, provider, _) {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DashboardDrawerContent(scaffoldKey: scaffoldKey),
                  SizedBox(
                    height: 20.h,
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
                          'news_list'.tr(),
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
                        const SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          height: 40.h,
                          child: TextFormField(
                            cursorColor: blackColor,
                            style: const TextStyle(color: blackColor),
                            validator: (val) =>
                                val!.isEmpty ? 'Field must be filled' : null,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: whiteColor.withOpacity(0.50),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      color: greyColor.withOpacity(0.6),
                                      width: 1.0),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 13.h, horizontal: 16.w),
                                hintText: 'search_news'.tr(),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      color: greyColor.withOpacity(0.6)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      color: greyColor.withOpacity(0.6)),
                                ),
                                suffixIcon: const Icon(
                                  Icons.mic_rounded,
                                  color: Colors.black,
                                ),
                                hintStyle: TextStyle(
                                    fontSize: 14.r,
                                    color: black2Sd,
                                    fontWeight: FontWeight.w400),
                                border: const OutlineInputBorder()),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          'news_title'.tr(),
                          style: TextStyle(
                              color: blackColor,
                              fontSize: 14.r,
                              fontWeight: FontWeight.w500),
                        ),
                        const Divider(thickness: 0.6),
                        const SizedBox(
                          height: 5,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              provider.myPostResponsesData?.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            final data =
                                provider.myPostResponsesData?.data?[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: CachedNetworkImage(
                                        height:
                                            DeviceUtil.isTablet ? 60.h : 40.h,
                                        fit: BoxFit.cover,
                                        imageUrl: "${data?.pathLarge}",
                                        placeholder: (context, url) => Center(
                                          child: Image.asset(
                                              "assets/images/no_image_found.png"),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                                "assets/images/no_image_found.png"),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Expanded(
                                      child: Text(
                                        data?.title ?? '',
                                        maxLines: 2,
                                        style: TextStyle(fontSize: 12.r),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Divider(thickness: 0.6),
                              ],
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
