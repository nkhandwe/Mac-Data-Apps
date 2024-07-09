import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:landlord/components/custom_rectangular_card.dart';
import 'package:landlord/data/model/breaking_news_slider_model.dart';
import 'package:landlord/data/model/sub_category_model.dart';
import 'package:landlord/data/network/repository/repository.dart';
import 'package:landlord/pages/home/content/custom_news_item.dart';
import 'package:landlord/pages/home/content/custom_slider_news.dart';

import '../../../utils/nav_utail.dart';
import '../../details/view/details_page.dart';

class CategoryItemList extends StatelessWidget {
  final String slug;
  const CategoryItemList({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    final CarouselController controller2 = CarouselController();

    return FutureBuilder<SubCategoryModel?>(
        future: RepositoryImpl(context).getCategoryListData(slug),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return Column(
              children: [
                CustomSliderNews(
                  controller2: controller2,
                  snapShot: snapShot,
                ),
                const SizedBox(
                  height: 10,
                ),
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
                            context,
                            DetailsPage(
                              slug:
                                  snapShot.data!.data!.nonSlider![index].slug!,
                            ));
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
            );
          }
          return const CustomRectangularCard();
        });
  }
}
