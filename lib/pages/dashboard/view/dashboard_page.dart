import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/dashboard_drawer.dart';
import 'package:landlord/components/global_app_bar.dart';
import 'package:landlord/data/local/local_auth_provider.dart';
import 'package:landlord/data/provider/dashboard_provider.dart';
import 'package:landlord/pages/home/content/news_drawer.dart';
import 'package:landlord/utils/shimmers.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    final user = Provider.of<LocalAuthProvider>(context).getUser();
    return Scaffold(
      key: scaffoldKey,
      drawer: const NewsDrawer(),
      backgroundColor: whiteColor,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(120), child: GlobalAppBar()),
      body: ChangeNotifierProvider(
        create: (context) => DashBoardProvider(context),
        child: Consumer<DashBoardProvider>(builder: (context, provider, _) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0.r),
              child: Column(
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
                          "Hi ${user?.name}",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 16.r),
                        ),
                        const Divider(
                          thickness: 0.6,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        provider.dashboardResponse?.data?.isNotEmpty == true
                            ? ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:
                                    provider.dashboardResponse?.data?.length ??
                                        0,
                                itemBuilder: (context, index) {
                                  final data =
                                      provider.dashboardResponse?.data?[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                data?.title ?? '',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 14.r),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                data?.count.toString() ?? '',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 14.r),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          const Icon(Icons.article_outlined)
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )
                            : Column(
                                children: [
                                  RectangularCardShimmer(
                                    height: 60.h,
                                    width: double.infinity,
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  RectangularCardShimmer(
                                    height: 60.h,
                                    width: double.infinity,
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  RectangularCardShimmer(
                                    height: 60.h,
                                    width: double.infinity,
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                ],
                              )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
