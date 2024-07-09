import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_rectangular_card.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/provider/saved_article_provider.dart';
import 'package:landlord/utils/shimmers.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class SavedArticleContent extends StatelessWidget {
  const SavedArticleContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SavedArticleProvider(context),
      child: Consumer<SavedArticleProvider>(builder: (context, provider, _) {
        return provider.savedArticle?.data?.isNotEmpty == true
            ? ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: provider.savedArticle?.data?.length ?? 0,
                itemBuilder: (context, index) {
                  final data = provider.savedArticle?.data?[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          CachedNetworkImage(
                            // height: DeviceUtil.isTablet ? 200.h : 160.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            imageUrl: data?.pathLarge ?? '',
                            placeholder: (context, url) => Center(
                              child: Image.asset(
                                  "assets/images/no_image_found.png"),
                            ),
                            errorWidget: (context, url, error) =>
                                Image.asset("assets/images/no_image_found.png"),
                          ),
                          Positioned(
                            left: 9.w,
                            bottom: 9.h,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: blackColor,
                              ),
                              child: CustomText(
                                text: data?.category,
                                color: whiteColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 14.r,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 9.w,
                            bottom: 9.h,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: redColor,
                                  size: 18.r,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Icon(
                                  Icons.delete,
                                  color: redColor,
                                  size: 18.r,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: data?.title,
                            fontWeight: FontWeight.w700,
                            color: blackColor,
                            fontSize: 12.r,
                            maxLine: 1,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          CustomText(
                            maxLine: 2,
                            text: data?.content,
                            color: blackColor,
                            fontSize: 11.r,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.watch_later_outlined,
                                color: greyColor,
                                size: 12.r,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              CustomText(
                                text: data?.updatedAt,
                                fontSize: 9.r,
                                color: blackColor,
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      const Divider(
                        thickness: 0.6,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                    ],
                  );
                },
              )
            : const CustomRectangularCard();
      }),
    );
  }
}
