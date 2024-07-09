import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/utils/theme/app_colors.dart';

import '../../../data/model/news_details_model.dart';

class DetailsNewsTitle extends StatelessWidget {
  DetailsNewsTitle({super.key, required this.newsDetails});
  NewsDetailsModel? newsDetails;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          newsDetails?.data?.news?.title ?? "",
          style: TextStyle(
              color: blackColor, fontSize: 15.r, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 18.h,
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Row(
            children: [
              Icon(
                Icons.record_voice_over,
                size: 15.r,
                color: black2Sd,
              ),
              SizedBox(
                width: 7.w,
              ),
              CustomText(
                text: "${newsDetails?.data?.news?.author}",
                fontSize: 12.r,
                color: black2Sd,
              )
            ],
          ),
          subtitle: Row(
            children: [
              Icon(
                Icons.access_time,
                size: 15.r,
                color: black2Sd,
              ),
              SizedBox(
                width: 8.w,
              ),
              CustomText(
                text: "${newsDetails?.data?.news?.updatedAt}",
                fontSize: 11.r,
                color: black2Sd,
              )
            ],
          ),
          trailing: IconButton(
              onPressed: () {}, icon: Icon(Icons.bookmark_add_outlined)),
        ),

        SizedBox(
          height: 5.h,
        ),

        // SizedBox(
        //   height: 6.h,
        // ),
        // Row(
        //   children: [
        //     Icon(
        //       Icons.facebook,
        //       size: 17.r,
        //       color: black2Sd,
        //     ),
        //     SizedBox(
        //       width: 8.w,
        //     ),
        //     Icon(
        //       Icons.facebook,
        //       size: 17.r,
        //       color: black2Sd,
        //     ),
        //     SizedBox(
        //       width: 8.w,
        //     ),
        //     Icon(
        //       Icons.facebook,
        //       size: 17.r,
        //       color: black2Sd,
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
