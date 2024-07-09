import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/data/model/news_category_model.dart';
import 'package:landlord/pages/home/content/category_wise_news_list.dart';
import 'package:landlord/utils/nav_utail.dart';

class MenuButton extends StatelessWidget {
  final NewsCategoryModel? newsData;
  const MenuButton({super.key, this.newsData});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.white,
      icon: const Icon(Icons.menu),
      shadowColor: Colors.white,
      onSelected: (value) {
        // your logic
      },
      itemBuilder: (context) => newsData!.data!
          .map(
            (item) => PopupMenuItem<NewsCategoryModel>(
              child: SizedBox(
                width: 200.w,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    dividerColor: Colors.transparent,
                  ),
                  child: ExpansionTile(
                    title: Text(item.title ?? ''),
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                        item.childCategory?.length ?? 0,
                        (e) => InkWell(
                              onTap: () {
                                NavUtil.navigateScreen(
                                    context,
                                    CategoryWiseNewsList(
                                        slug: item.childCategory?[e].slug));
                              },
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.0.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.childCategory?[e].title ?? '',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.6)),
                                    ),
                                    // SizedBox(height: ,)
                                    const Divider(),
                                  ],
                                ),
                              ),
                            )),
                  ),
                ),
              ),
              // onTap: () {
              //   NavUtil.navigateScreen(context, const NewsCategoryPage());
              // },
            ),
          )
          .toList(),
    );
  }
}
