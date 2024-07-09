import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/pages/details/content/user_comment_widget.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';
import '../../../data/model/news_details_model.dart';
import '../../../data/provider/news_details_provider.dart';

class DetailsCommentSection extends StatelessWidget {
  const DetailsCommentSection({super.key, required this.newsDetails,});

  final NewsDetailsModel newsDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20.h,
        ),
        Text(
          "write_your_comment".tr(),
          style: TextStyle(
              color: blackColor, fontSize: 15.r, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 8.h,
        ),
        const Divider(
          thickness: 0.6,
        ),
        SizedBox(
          height: 18.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
                border: Border.all(color: greyColor.withOpacity(0.4)),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller :  context.read<NewsDetailsProvider>().commentTextController,
              maxLines: 4, //or null
              decoration: InputDecoration(
                  hintText: "comments".tr(),
                  border: InputBorder.none,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () {
                    if (context.read<NewsDetailsProvider>().userInfo?.id != null) {
                      context.read<NewsDetailsProvider>().commentPost(context);
                      context.read<NewsDetailsProvider>().newsDetailsData(context, newsDetails.data?.news?.slug ?? "");
                    } else {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext ctx) => AlertDialog(
                          title:  Text("Before comment you need to login first", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.sp,  fontWeight: FontWeight.bold),),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Ok'),
                            ),
                          ],
                        ),
                      );
                    }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: redColor,
                ),
                child: Text(
                  'comment'.tr(),
                  style: TextStyle(color: whiteColor, fontSize: 12.r),
                )),
          ],
        ),
        SizedBox(
          height: 5.h,
        ),
        UserCommentWidget(
          newsDetails: newsDetails,
        )
      ],
    );
  }
}
