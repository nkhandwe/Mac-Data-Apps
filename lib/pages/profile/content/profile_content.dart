import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/local/local_auth_provider.dart';
import 'package:landlord/pages/profile/content/edit_profile_screen.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocalAuthProvider>(context, listen: false);
    final user = provider.getUser();
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: greyColor.withOpacity(0.06),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'my_profile'.tr(),
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.r),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  NavUtil.navigateScreen(context, const EditProfileScreen());
                },
                child: Text(
                  'edit_profile'.tr(),
                  style: TextStyle(
                      color: redColor,
                      fontSize: 12.r,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 0.6,
          ),
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(50.r),
            child: CachedNetworkImage(
              height: 48.h,
              width: 48.w,
              fit: BoxFit.cover,
              imageUrl: user?.avatar ?? '',
              placeholder: (context, url) => Center(
                child: Image.asset("assets/images/no_image_found.png"),
              ),
              errorWidget: (context, url, error) =>
                  Image.asset("assets/images/no_image_found.png"),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          CustomText(
            text: user?.name,
            fontSize: 14.r,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            height: 16.h,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(width: 0.2),
                borderRadius: BorderRadius.circular(4)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'phone_number'.tr(),
                  style: TextStyle(
                      color: black2Sd,
                      fontSize: 12.r,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    Icon(Icons.call, size: 18.r, color: greyColor),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      user?.phone ?? '',
                      style: TextStyle(color: black2Sd, fontSize: 10.r),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(width: 0.2),
                borderRadius: BorderRadius.circular(4)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'email'.tr(),
                  style: TextStyle(
                      color: black2Sd,
                      fontSize: 12.r,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    Icon(Icons.email_outlined, size: 18.r, color: greyColor),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      user?.email ?? '',
                      style: TextStyle(color: black2Sd, fontSize: 10.r),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(width: 0.2),
                borderRadius: BorderRadius.circular(4)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'address'.tr(),
                  style: TextStyle(
                      color: black2Sd,
                      fontSize: 12.r,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 18.r,
                      color: greyColor,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      user?.address ?? 'Dhaka Bangladesh',
                      style: TextStyle(color: black2Sd, fontSize: 10.r),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
        ],
      ),
    );
  }
}
