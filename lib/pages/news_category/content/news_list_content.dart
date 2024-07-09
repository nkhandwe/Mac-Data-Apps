import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class NewsListContent extends StatelessWidget {
  const NewsListContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(children: [
              CustomText(
                text: 'news',
                color: blackColor,
                fontWeight: FontWeight.bold,
                fontSize: 17.r,
              ),
              const Spacer(),
              CustomText(
                text: 'view_all',
                color: greyColor,
                fontSize: 13.r,
              ),
              SizedBox(
                width: 5.w,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 15.r,
                color: greyColor,
              )
            ]),
            SizedBox(
              height: 9.h,
            ),
            const Divider(
              thickness: 0.5,
            ),
            SizedBox(
              height: 9.h,
            ),
            Container(
              color: blackColor.withOpacity(0.7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        "assets/images/news_demo_image.png",
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        left: 10,
                        bottom: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: blackColor,
                          ),
                          child: CustomText(
                            text: "Bangladesh",
                            color: whiteColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.r,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "12th parliamentary election: 71 incumbent MPs",
                          fontWeight: FontWeight.w700,
                          color: whiteColor,
                          fontSize: 12.r,
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.watch_later_outlined,
                              color: greyColor,
                              size: 11.sp,
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            CustomText(
                              text: "Update 23 July 23 | 12:6 p.m",
                              fontSize: 9.r,
                              color: whiteColor,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        CustomText(
                          maxLine: 3,
                          text:
                              "12th parliamentary election: 71 incumbent MPs 12th parliamentary election: 71 incumbent MPs ",
                          color: whiteColor,
                          fontSize: 11.r,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )
    ]));
  }
}
