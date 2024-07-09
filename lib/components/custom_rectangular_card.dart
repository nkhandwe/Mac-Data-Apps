import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/utils/shimmers.dart';

class CustomRectangularCard extends StatelessWidget {
  const CustomRectangularCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const RectangularCardShimmer(
          height: 150,
          width: double.infinity,
        ),
        SizedBox(
          height: 16.h,
        ),
        const RectangularCardShimmer(
          height: 150,
          width: double.infinity,
        ),
        SizedBox(
          height: 16.h,
        ),
        const RectangularCardShimmer(
          height: 150,
          width: double.infinity,
        ),
        SizedBox(
          height: 16.h,
        )
      ],
    );
  }
}
