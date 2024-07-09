import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:landlord/data/provider/home_provider.dart';
import 'package:landlord/pages/home/content/ad_mob_card.dart';
import 'package:landlord/pages/home/content/breaking_news_content.dart';
import 'package:landlord/pages/home/content/category_item.dart';
import 'package:landlord/pages/home/content/sliver_common_news_content.dart';
import 'package:landlord/pages/home/content/marquee_text_widget.dart';
import 'package:landlord/pages/home/content/tab_bar_news_title.dart';
import 'package:landlord/pages/home/content/tab_bar_news_view.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

import 'content/news_home_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    return Scaffold(
      backgroundColor: whiteColor,
      body: DefaultTabController(
        length: 2,
        child: CustomScrollView(
          slivers: [
            NewsHomeAppBar(newsData: provider.newsCategoryData),
            const MarqueeTextWidget(),
            BreakingNewsContent(
              controller: _controller,
            ),
            // SliderFeaturedNews(controller1: _controller1),
            SliverCommonNewsContent(
                serialNewsData: provider.serialOneToFiveData),
            const AdMobCard(),
            const TabBarNewsTitle(),
            const TabBarNewsView(),
            const AdMobCard(),
            CategoryItem(provider: provider),
            const AdMobCard(),
            SliverCommonNewsContent(
                serialNewsData: provider.serialSixToEightData),
            const AdMobCard(),
            SliverCommonNewsContent(
                serialNewsData: provider.serialNineToTwelveData),
            const AdMobCard(),
            SliverCommonNewsContent(
                serialNewsData: provider.serialThirteenToFifteenData),
            const AdMobCard(),
            SliverCommonNewsContent(
                serialNewsData: provider.serialSixteenToTwentyData),
            const AdMobCard(),
            SliverCommonNewsContent(
                serialNewsData: provider.serialTwentyOneToTwentyThreeData),
            const AdMobCard(),
          ],
        ),
      ),
    );
  }
}
