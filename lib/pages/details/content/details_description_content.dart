import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/utils/theme/app_colors.dart';

import '../../../data/model/news_details_model.dart';

class DetailsDescriptionContent extends StatelessWidget {
  const DetailsDescriptionContent({super.key, required this.newsDetails});
  final NewsDetailsModel newsDetails;

  @override
  Widget build(BuildContext context) {
    return Text(
      "${newsDetails.data?.news?.content}",
      textAlign: TextAlign.justify,
      style: TextStyle(
          color: blackColor, fontSize: 12.r, fontWeight: FontWeight.w400),
    );
  }
}
