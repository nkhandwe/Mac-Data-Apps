import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleWithFromField extends StatelessWidget {
  const TitleWithFromField({
    required this.title,
    this.hintText,
    this.controller,
    super.key,
  });

  final TextEditingController? controller;
  final String title;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0.h),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: const Color(0xFF666666), fontWeight: FontWeight.bold),
          ),
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
              hintText: hintText ?? '',
              fillColor: Colors.white,
              filled: true,
              border: InputBorder.none),
          validator: (val) => val!.isEmpty ? 'Field must be filled' : null,
        ),
      ],
    );
  }
}
