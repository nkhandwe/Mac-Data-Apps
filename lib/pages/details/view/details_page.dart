import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/data/local/local_auth_provider.dart';
import 'package:landlord/pages/details/content/details_carosul_slider.dart';
import 'package:landlord/pages/details/content/details_description_content.dart';
import 'package:landlord/pages/details/content/details_news_comment_section.dart';
import 'package:landlord/pages/details/content/details_news_title.dart';
import 'package:landlord/pages/details/content/latest_news_content.dart';
import 'package:landlord/pages/login/view/login_page.dart';
import 'package:landlord/pages/profile/view/profile_screen.dart';
import 'package:landlord/pages/search/view/search_page.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../data/provider/news_details_provider.dart';
import '../content/marquee_text_widget.dart';
import '../content/news_details_shimmer.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.slug});

  final String slug;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocalAuthProvider>(context, listen: false);
    final user = provider.getUser();
    final CarouselController controller = CarouselController();
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
        actions: [
          IconButton(
              padding: const EdgeInsets.only(left: 8, right: 8),
              onPressed: () {
                NavUtil.navigateScreen(context, const SearchPage());
              },
              icon: user?.id != null
                  ? const Icon(Icons.search)
                  : const Icon(Icons.login)),
          IconButton(
              padding: const EdgeInsets.only(right: 16),
              onPressed: () {
                setState(() {
                  if (user?.id != null) {
                    NavUtil.navigateScreen(context, const ProfileScreen());
                  } else {
                    NavUtil.navigateScreen(context, const LoginPage());
                  }
                });
              },
              icon: const Icon(Icons.person)),
        ],
      ),
      body: ChangeNotifierProvider(
        create: (context) => NewsDetailsProvider(context, widget.slug),
        child: Consumer<NewsDetailsProvider>(builder: (context, provider, _) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const MarqueeTextWidget(),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: provider.newsDetailsResponse?.data?.news != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DetailsNewsTitle(
                                newsDetails: provider.newsDetailsResponse,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              DetailsCarousalSlider(
                                controller: controller,
                                newsDetails: provider.newsDetailsResponse!,
                              ),
                              DetailsDescriptionContent(
                                newsDetails: provider.newsDetailsResponse!,
                              ),
                              DetailsCommentSection(
                                newsDetails: provider.newsDetailsResponse!,
                              ),
                              const LatestNewsContent()
                            ],
                          )
                        : const NewsDetailsShimmer())
              ],
            ),
          );
        }),
      ),
    );
  }
}
