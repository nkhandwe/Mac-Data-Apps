import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_rectangular_card.dart';
import 'package:landlord/components/device_util.dart';
import 'package:landlord/components/global_app_bar.dart';
import 'package:landlord/data/provider/newsletter_provider.dart';
import 'package:landlord/pages/home/content/news_drawer.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class NewsletterPage extends StatelessWidget {
  const NewsletterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

    return ChangeNotifierProvider(
      create: (context) => NewsletterProvider(context),
      child: Consumer<NewsletterProvider>(builder: (context, provider, _) {
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
                  Row(
                    children: [
                      Text(
                        'dashboard_menu'.tr(),
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18.r),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 4),
                        decoration: BoxDecoration(
                          color: blackColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: InkWell(
                          onTap: () {
                            scaffoldKey.currentState?.openDrawer();
                          },
                          child: Icon(
                            Icons.menu_outlined,
                            color: whiteColor,
                            size: 18.r,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: greyColor.withOpacity(0.06),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'newsletter_setting'.tr(),
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 16.r),
                        ),
                        const Divider(
                          thickness: 0.6,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        provider.newsletterData?.data?.isNotEmpty == true
                            ? ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:
                                    provider.newsletterData?.data?.length ?? 0,
                                itemBuilder: (context, index) {
                                  final data =
                                      provider.newsletterData?.data?[index];
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            data?.title ?? '',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 12.r),
                                          ),
                                          const Spacer(),
                                          Transform.scale(
                                            scaleX: 0.6,
                                            scaleY: 0.6,
                                            child: Switch.adaptive(
                                              activeTrackColor: redColor,
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              value: data?.value == '1',
                                              onChanged: (value) {
                                                print(provider
                                                    .setSwitchValue(value));
                                                provider
                                                    .postNewsletterSettingsData(
                                                        context,
                                                        data!.key!,
                                                        provider.setSwitchValue(
                                                            value));
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                      const Divider(
                                        thickness: 0.6,
                                      ),
                                    ],
                                  );
                                },
                              )
                            : const CustomRectangularCard()
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
