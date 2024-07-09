import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class CreateDropDownItem extends StatefulWidget {
  const CreateDropDownItem({super.key});

  @override
  State<CreateDropDownItem> createState() => _CreateDropDownItemState();
}

class _CreateDropDownItemState extends State<CreateDropDownItem> {
  String dropdownValue1 = 'Category';
  String dropdownValue2 = 'Sub Category';
  String dropdownValue3 = 'Language';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20.h,
        ),
        Text(
          'category'.tr(),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12.r,
            color: black2Sd,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          height: 45.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0),
          decoration: BoxDecoration(
              color: greyColor.withOpacity(0.04),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xffD9D9D9))),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: dropdownValue1,
              icon: const Icon(Icons.keyboard_arrow_down),
              elevation: 16,
              style: TextStyle(
                  color: const Color(
                    0xff8A8A8A,
                  ),
                  fontSize: 14.r),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue1 = newValue!;
                });
              },
              items: <String>[
                'Category',
                'Category 1',
                'Category 2',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          'sub_category'.tr(),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12.r,
            color: black2Sd,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          height: 45.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0),
          decoration: BoxDecoration(
              color: greyColor.withOpacity(0.04),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xffD9D9D9))),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: dropdownValue2,
              icon: const Icon(Icons.keyboard_arrow_down),
              elevation: 16,
              style: TextStyle(
                  color: const Color(
                    0xff8A8A8A,
                  ),
                  fontSize: 14.r),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue2 = newValue!;
                });
              },
              items: <String>[
                'Sub Category',
                'Sub Category 1',
                'Sub Category 2',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          'language'.tr(),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12.r,
            color: black2Sd,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          height: 45.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0),
          decoration: BoxDecoration(
              color: greyColor.withOpacity(0.04),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xffD9D9D9))),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: dropdownValue3,
              icon: const Icon(Icons.keyboard_arrow_down),
              elevation: 16,
              style: TextStyle(
                  color: const Color(
                    0xff8A8A8A,
                  ),
                  fontSize: 14.r),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue3 = newValue!;
                });
              },
              items: <String>[
                'Language',
                'Sub Category 1',
                'Sub Category 2',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
