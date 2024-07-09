import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/pages/home/content/marquee_text_widget.dart';
import 'package:landlord/pages/home/content/tab_bar_news_title.dart';
import 'package:landlord/pages/home/content/tab_bar_news_view.dart';
import 'package:landlord/pages/login/view/login_page.dart';
import 'package:landlord/pages/news_category/content/news_category_header.dart';
import 'package:landlord/pages/news_category/content/news_list_content.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class NewsCategoryPage extends StatefulWidget {
  const NewsCategoryPage({super.key});

  @override
  State<NewsCategoryPage> createState() => _NewsCategoryPageState();
}

class _NewsCategoryPageState extends State<NewsCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: DefaultTabController(
        length: 2,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: true,
              title: Center(
                child: Image.asset('assets/drawer/app_logo.png',
                  height: 15.h, fit: BoxFit.cover)),
              actions: [
                IconButton(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    onPressed: () {},
                    icon: const Icon(Icons.search)),
                IconButton(
                    padding: const EdgeInsets.only(right: 16),
                    onPressed: () {
                      NavUtil.navigateScreen(context, const LoginPage());
                    },
                    icon: const Icon(Icons.login)),
              ],
            ),
            const MarqueeTextWidget(),
            const NewsCategoryHeader(),
            const TabBarNewsTitle(),
            const TabBarNewsView(),
            const NewsListContent(),
          ],
        ),
      ),
    );
  }
}
