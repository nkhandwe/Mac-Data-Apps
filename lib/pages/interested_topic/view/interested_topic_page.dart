import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_rectangular_card.dart';
import 'package:landlord/components/dashboard_drawer.dart';
import 'package:landlord/components/device_util.dart';
import 'package:landlord/components/global_app_bar.dart';
import 'package:landlord/data/provider/interested_topic_provider.dart';
import 'package:landlord/pages/home/content/news_drawer.dart';
import 'package:landlord/utils/debounce.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class InterestedTopicPage extends StatefulWidget {
  const InterestedTopicPage({super.key});

  @override
  State<InterestedTopicPage> createState() => _InterestedTopicPageState();
}

class _InterestedTopicPageState extends State<InterestedTopicPage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    final Debounce _debounce = Debounce(const Duration(milliseconds: 400));
    return ChangeNotifierProvider(
      create: (context) => InterestedTopicProvider(context),
      child: Consumer<InterestedTopicProvider>(builder: (context, provider, _) {
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
                  const SizedBox(
                    height: 20,
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
                          "interested_post_by_topic".tr(),
                          style: TextStyle(
                              fontSize: 16.r, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Divider(thickness: 0.6),
                        const SizedBox(
                          height: 6,
                        ),
                        provider.interestedTopic?.data?.isNotEmpty == true
                            ? GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    provider.interestedTopic?.data?.length ?? 0,
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing: 15.r,
                                        crossAxisSpacing: 15.r,
                                        mainAxisExtent:
                                            DeviceUtil.isTablet ? 180.r : 130.r,
                                        crossAxisCount: 2),
                                itemBuilder: (context, index) {
                                  final data =
                                      provider.interestedTopic?.data?[index];
                                  return Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: whiteColor),
                                    child: Stack(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CachedNetworkImage(
                                              height: 90.h,
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                              imageUrl: data?.image ?? '',
                                              placeholder: (context, url) =>
                                                  Center(
                                                child: Image.asset(
                                                    "assets/images/no_image_found.png"),
                                              ),
                                              errorWidget: (context, url,
                                                      error) =>
                                                  Image.asset(
                                                      "assets/images/no_image_found.png"),
                                            ),
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: Text(
                                                data?.title ?? "",
                                                style:
                                                    TextStyle(fontSize: 14.r),
                                              ),
                                            )
                                          ],
                                        ),
                                        Positioned(
                                          right: -8.r,
                                          top: -8.r,
                                          child: Checkbox(
                                            value: data?.isMyInterested,
                                            // onChanged: (value) {},
                                            onChanged: (value) {
                                              setState(() {
                                                _debounce(
                                                  () async {
                                                    data?.isMyInterested =
                                                        value;
                                                    await provider
                                                        .postInterestedTopicData(
                                                            context, data?.id);
                                                  },
                                                );
                                              });
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              )
                            : const CustomRectangularCard(),
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
