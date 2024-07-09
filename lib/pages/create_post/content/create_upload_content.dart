import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/device_util.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class CreateUploadContent extends StatelessWidget {
  const CreateUploadContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'upload_image'.tr(),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12.r,
            color: black2Sd,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        // ClipRRect(
        //     borderRadius: BorderRadius.circular(10.0),
        //     child: CachedNetworkImage(
        //       height: DeviceUtil.isTablet ? 200.h : 100.h,
        //       width: double.infinity,
        //       fit: BoxFit.cover,
        //       imageUrl: "",
        //       placeholder: (context, url) => Center(
        //         child: Image.asset("assets/drawer/app_logo.png"),
        //       ),
        //       errorWidget: (context, url, error) => const Icon(Icons.error),
        //     )),
        const SizedBox(
          height: 16,
        ),
        InkWell(
          onTap: () {
            // context
            //     .read<UploadFileBloc>()
            //     .add(SelectFile(context: context));
          },
          child: Container(
            height: DeviceUtil.isTablet ? 45.h : 45,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.green,
                style: BorderStyle.solid,
                width: 0.0,
              ),
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: DottedBorder(
              color: const Color(0xffC7C7C7),
              borderType: BorderType.RRect,
              radius: const Radius.circular(10.0),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              strokeWidth: 2,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.upload_file,
                      color: Colors.grey,
                      size: DeviceUtil.isTablet ? 16.r : 16,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      tr("add_image"),
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: DeviceUtil.isTablet ? 12.r : 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'content'.tr(),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12.r,
            color: black2Sd,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
            cursorColor: greyColor,
            cursorHeight: 22,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    BorderSide(color: greyColor.withOpacity(0.6), width: 0.6),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    BorderSide(color: greyColor.withOpacity(0.6), width: 0.6),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: greyColor.withOpacity(0.6)),
              ),
            )),
      ],
    );
  }
}
