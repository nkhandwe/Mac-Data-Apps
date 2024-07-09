import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:landlord/animation/staggered_animation.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/components/device_util.dart';
import 'package:landlord/components/global_app_bar.dart';
import 'package:landlord/data/local/local_auth_provider.dart';
import 'package:landlord/data/provider/edit_profile_provider.dart';
import 'package:landlord/pages/home/content/news_drawer.dart';
import 'package:landlord/pages/login/content/auth_text_form_field.dart';
import 'package:landlord/utils/custom_image_picker_dialog.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  Future<void> playAnimation() async {
    try {
      await animationController?.forward();

      Timer(const Duration(seconds: 2), () async {
        await stopAnimation();
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> stopAnimation() async {
    try {
      await animationController?.reverse();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<LocalAuthProvider>(context, listen: false);
    // final profile = provider.getUser();
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    final formKey = GlobalKey<FormState>();

    return ChangeNotifierProvider(
      create: (context) => EditProfileProvider(context),
      child: Consumer<EditProfileProvider>(builder: (context, provider, _) {
        final userProvider =
            Provider.of<LocalAuthProvider>(context, listen: false);
        final user = userProvider.getUser();
        return Form(
          key: formKey,
          child: Scaffold(
            key: scaffoldKey,
            drawer: const NewsDrawer(),
            backgroundColor: whiteColor,
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(DeviceUtil.isTablet ? 120 : 95),
                child: const GlobalAppBar()),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'dashboard_menu'.tr(),
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18.r),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 4),
                          decoration: BoxDecoration(
                            color: blackColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: InkWell(
                            onTap: () {
                              scaffoldKey.currentState?.openDrawer();
                            },
                            child: Icon(
                              Icons.menu_outlined,
                              color: whiteColor,
                              size: 18.r,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: greyColor.withOpacity(0.06),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "edit_profile",
                            fontSize: 16.r,
                            fontWeight: FontWeight.w600,
                          ),
                          const Divider(
                            thickness: 0.6,
                          ),
                          // user?.avatar != null
                          //     ? InkWell(
                          //         onTap: () {
                          //           pickImage(context);
                          //         },
                          //         child: ClipRRect(
                          //           borderRadius: BorderRadius.circular(50),
                          //           child: CachedNetworkImage(
                          //             height: 60.0.h,
                          //             width: 60.0.w,
                          //             fit: BoxFit.cover,
                          //             imageUrl: profileImage ?? '',
                          //             placeholder: (context, url) => Center(
                          //               child: Image.asset(
                          //                   "assets/images/ic_no_image.png"),
                          //             ),
                          //             errorWidget: (context, url, error) =>
                          //                 Image.asset(
                          //                     "assets/images/ic_no_image.png"),
                          //           ),
                          //         ),
                          //       )
                          //     :

                          // ClipRRect(
                          //           borderRadius: BorderRadius.circular(50),
                          //           child: CachedNetworkImage(
                          //             height: 60.0.h,
                          //             width: 60.0.w,
                          //             fit: BoxFit.cover,
                          //             imageUrl: provider.profileImage ?? '',
                          //             placeholder: (context, url) => Center(
                          //               child: Image.asset(
                          //                   "assets/images/ic_no_image.png"),
                          //             ),
                          //             errorWidget: (context, url, error) =>
                          //                 Image.asset(
                          //                     "assets/images/ic_no_image.png"),
                          //           ),
                          //         ),
                          // InkWell(
                          //   onTap: () {
                          //     provider.pickImage(context);
                          //   },
                          //   child: Container(
                          //     height: 60.h,
                          //     width: 60.w,
                          //     decoration: BoxDecoration(
                          //         color: Colors.white,
                          //         shape: BoxShape.circle,
                          //         image: DecorationImage(
                          //           image: FileImage(
                          //             provider.imagePath!,
                          //           ),
                          //           fit: BoxFit.cover,
                          //         ),
                          //         border: Border.all(
                          //             color: const Color(0xff999999),
                          //             width: 2)),
                          //   ),
                          // ),
                          InkWell(
                            onTap: () => provider.pickImage(context),
                            child: provider.imagePath != null
                                ? Container(
                                    height: 84.h,
                                    width: 84.w,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: FileImage(
                                            provider.imagePath!,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        border: Border.all(
                                            color: const Color(0xff999999),
                                            width: 2)),
                                  )
                                : Container(
                                    height: 60.h,
                                    width: 60.w,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: const Color(0xff999999),
                                            width: 2)),
                                  ),
                          ),
                          AuthFromField(
                            controller: provider.nameController,
                            title: "name",
                            hintText: "",
                            textColor: black2Sd,
                            fillColor: greyColor.withOpacity(0.04),
                            onChange: (p0) {},
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          AuthFromField(
                            controller: provider.phoneNumController,
                            title: "phone_number",
                            hintText: "",
                            textColor: black2Sd,
                            fillColor: greyColor.withOpacity(0.04),
                            onChange: (p0) {},
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          AuthFromField(
                            controller: provider.emailController,
                            title: "email",
                            hintText: "",
                            textColor: black2Sd,
                            fillColor: greyColor.withOpacity(0.04),
                            onChange: (p0) {},
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          AuthFromField(
                            controller: provider.addressController,
                            title: "address",
                            hintText: "",
                            textColor: black2Sd,
                            fillColor: greyColor.withOpacity(0.04),
                            onChange: (p0) {},
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            height: 30.h,
                            width: double.infinity,
                            child: StaggerAnimation(
                              title: 'Update',
                              color: Colors.black,
                              animationController: animationController,
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  provider.editProfile(context: context);
                                }
                                playAnimation();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
