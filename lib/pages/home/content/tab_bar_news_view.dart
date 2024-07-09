import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/data/provider/home_provider.dart';
import 'package:landlord/pages/home/content/common_news_widget.dart';
import 'package:provider/provider.dart';

class TabBarNewsView extends StatelessWidget {
  const TabBarNewsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    return SliverList(
        delegate: SliverChildListDelegate([
      SizedBox(
        height: 1110.h,
        child: TabBarView(children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CommonNewsWidget(
              provider: provider.currentNewsData,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CommonNewsWidget(
              provider: provider.trendingNewsData,
            ),
          ),
        ]),
      )
    ]));
  }
}
