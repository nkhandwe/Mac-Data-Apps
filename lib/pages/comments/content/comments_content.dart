import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/provider/comments_provider.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class CommentsContent extends StatelessWidget {
  final CommentsProvider? provider;
  const CommentsContent({super.key, this.provider});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: provider?.commentResponsesData?.data?.data?.length ?? 0,
      itemBuilder: (context, index) {
        final data = provider?.commentResponsesData?.data?.data?[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: data?.news?.title,
              fontWeight: FontWeight.w700,
              color: blackColor,
              fontSize: 12.r,
            ),
            SizedBox(
              height: 8.h,
            ),
            CustomText(
              maxLine: 3,
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
                  color: blackColor,
                  size: 12.r,
                ),
                SizedBox(
                  width: 4.w,
                ),
                CustomText(
                  text: data?.lastUpdatedAt.toString(),
                  fontSize: 9.r,
                  color: blackColor,
                )
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            SizedBox(
              height: 35.h,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      side: const BorderSide(
                        width: 0.6,
                        color: Colors.black,
                      )),
                  child: Text(
                    'view_discussion'.tr(),
                    style: TextStyle(color: blackColor, fontSize: 12.r),
                  )),
            ),
            SizedBox(
              height: 8.h,
            ),
            const Divider(
              thickness: 0.6,
            ),
          ],
        );
      },
    );
  }
}
