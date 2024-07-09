import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/data/provider/search_provider.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class SearchTextField extends StatelessWidget {
  final SearchProvider? provider;
  const SearchTextField({super.key, this.provider});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: TextFormField(
        cursorColor: blackColor,
        style: const TextStyle(color: blackColor),
        validator: (val) => val!.isEmpty ? 'Field must be filled' : null,
        decoration: InputDecoration(
            filled: true,
            fillColor: whiteColor.withOpacity(0.50),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  BorderSide(color: greyColor.withOpacity(0.6), width: 1.0),
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 13.h, horizontal: 16.w),
            hintText: 'search_here'.tr(),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: greyColor.withOpacity(0.6)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: greyColor.withOpacity(0.6)),
            ),
            suffixIcon: const Icon(
              Icons.mic_rounded,
              color: Colors.black,
            ),
            hintStyle: const TextStyle(
                fontSize: 14, color: black2Sd, fontWeight: FontWeight.w400),
            border: const OutlineInputBorder()),
        onChanged: (value) {
          provider?.getKeywordSearchData(context: context, keyword: value);
        },
      ),
    );
  }
}
