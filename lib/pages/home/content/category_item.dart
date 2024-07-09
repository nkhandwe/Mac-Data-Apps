import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/provider/home_provider.dart';
import 'package:landlord/pages/category_wise_list/view/content_wise_list_page.dart';
import 'package:landlord/pages/home/content/category_item_list.dart';
import 'package:landlord/utils/theme/app_colors.dart';

import '../../../utils/nav_utail.dart';
import '../../details/view/details_page.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.provider,
  });

  final HomeProvider provider;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: provider.categoryData?.data?.length ?? 0,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(children: [
                  CustomText(
                    text: provider.categoryData?.data?[index].title,
                    color: blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.r,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      NavUtil.navigateScreen(
                          context,
                          CategoryWiseListPage(
                              slug: provider.categoryData?.data?[index].slug));
                    },
                    child: CustomText(
                      text: 'view_all'.tr(),
                      color: greyColor,
                      fontSize: 13.r,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14.r,
                    color: greyColor,
                  )
                ]),
                SizedBox(
                  height: 8.h,
                ),
                const Divider(
                  thickness: 0.5,
                ),
                SizedBox(
                  height: 10.h,
                ),
                if (provider.categoryData?.data != null)
                  CategoryItemList(
                    slug: provider.categoryData!.data![index].slug!,
                  )
              ],
            );
          },
        ),
      )
    ]));
  }
}
