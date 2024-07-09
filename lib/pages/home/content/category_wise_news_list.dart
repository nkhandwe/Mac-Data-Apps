import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_rectangular_card.dart';
import 'package:landlord/data/model/breaking_news_slider_model.dart';
import 'package:landlord/data/model/sub_category_model.dart';
import 'package:landlord/data/network/repository/repository.dart';
import 'package:landlord/pages/details/view/details_page.dart';
import 'package:landlord/pages/home/content/custom_news_item.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class CategoryWiseNewsList extends StatelessWidget {
  final String? slug;
  const CategoryWiseNewsList({super.key, this.slug});

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
              icon: const Icon(Icons.search)),
          IconButton(
              padding: const EdgeInsets.only(right: 16),
              onPressed: () {},
              icon: const Icon(Icons.person)),
        ],
      ),
      body: FutureBuilder<SubCategoryModel?>(
          future: RepositoryImpl(context).getCategoryListData(slug),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ListView.builder(
                        itemCount: snapShot.data?.data?.nonSlider?.length ?? 0,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final data = snapShot.data?.data?.nonSlider?[index];
                          return InkWell(
                            onTap: () {
                              NavUtil.navigateScreen(
                                  context, DetailsPage(slug: data!.slug!));
                            },
                            child: CustomNewsItem(
                              news: NewsData(
                                  pathLarge: data?.pathLarge,
                                  title: data?.title,
                                  category: data?.category,
                                  updatedAt: data?.updatedAt),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            } else {
              const CustomRectangularCard();
            }
            return const CustomRectangularCard();
          }),
    );
  }
}
