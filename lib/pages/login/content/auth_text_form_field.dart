import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/device_util.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class AuthFromField extends StatelessWidget {
  final Function()? onTap;
  final TextEditingController? controller;
  final String? title;
  final String? hintText;
  final IconButton? suffixIcon;
  final Icon? prefixIcon;
  final Function(String)? onChange;
  final Color? cursorColor;
  final Color? fillColor;
  final Color? textColor;

  const AuthFromField({
    super.key,
    this.hintText,
    this.title,
    this.suffixIcon,
    this.controller,
    this.prefixIcon,
    this.onChange,
    this.cursorColor,
    this.fillColor,
    this.onTap,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title',
          style: TextStyle(
              letterSpacing: 1,
              color: textColor ?? blackColor,
              fontSize: 14.r,
              fontWeight: FontWeight.w700),
        ).tr(),
        SizedBox(
          height: 8.h,
        ),
        TextFormField(
          cursorColor: cursorColor ?? greyColor,
          cursorHeight: DeviceUtil.isTablet ? 30 : 20.sp,
          style: TextStyle(color: blackColor, fontSize: 14.r),
          controller: controller,
          onChanged: onChange,
          validator: (val) => val!.isEmpty ? 'Field must be filled' : null,
          decoration: InputDecoration(
              filled: false,
              fillColor: fillColor ?? whiteColor.withOpacity(0.50),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: greyColor.withOpacity(0.6), width: 0.6),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
              hintText: '$hintText'.tr(),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: greyColor.withOpacity(0.6)),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: greyColor.withOpacity(0.6)),
              ),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              hintStyle: TextStyle(fontSize: 12.r,
                  color: black2Sd, fontWeight: FontWeight.w400),
              border: const OutlineInputBorder()),
        )
      ],
    );
  }
}
