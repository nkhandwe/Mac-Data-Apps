import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.height,
      this.letterSpacing,
      this.wordSpacing,
      this.textAlign,
      this.maxLine});

  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final double? height;
  final double? letterSpacing;
  final double? wordSpacing;
  final int? maxLine;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "".tr(),
      maxLines: maxLine,
      textAlign: textAlign,
      style: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          color: color,
          height: height),
    ).tr();
  }
}
